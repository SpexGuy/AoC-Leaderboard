const std = @import("std");
const unicode = std.unicode;
const print = std.debug.print;

const download = @import("download.zig");

const start_year = 1669870800;
const day_length = 24*60*60;

const DayInfo = struct {
    stars: [2]?u64 = [2]?u64{ null, null },
};

const Player = struct {
    name: []const u8 = "<missing>",
    id: u64 = 0,
    days: [25]DayInfo = [_]DayInfo{.{}} ** 25,
    local_score: u32 = 0,
    global_score: u32 = 0,
    stars: u32 = 0,
};

const PlayerOrder = enum {
    local, // local, stars, global
    global, // global, local, stars
    stars, // stars, local, global
};

const Options = struct {
    printOrder: PlayerOrder = .local,
    printTopPlayers: bool = false,
    limit: usize = ~@as(usize, 0),

    printAllPlayers: bool = false,
    targetPlayers: []const []const u8 = &[_][]const u8{},
    targetIDs: []const u64 = &[_]u64{},

    printAllDays: bool = false,
    targetDays: []const u32 = &[_]u32{},

    fn shouldPrintTopPlayer(self: Options, player: *const Player, index: usize) bool {
        for (self.targetPlayers) |target| {
            if (std.mem.eql(u8, target, player.name)) return true;
        }
        if (std.mem.indexOfScalar(u64, self.targetIDs, player.id) != null) return true;
        return index < self.limit;
    }
    fn shouldPrintPlayerDetail(self: Options, player: *const Player, index: usize) bool {
        if (self.printAllPlayers and index < self.limit) return true;
        for (self.targetPlayers) |target| {
            if (std.mem.eql(u8, target, player.name)) return true;
        }
        return std.mem.indexOfScalar(u64, self.targetIDs, player.id) != null;
    }
    fn shouldPrintPlayerTimes(self: Options, player: *const Player, index: usize, day: usize, star: usize) bool {
        for (self.targetPlayers) |target| {
            if (std.mem.eql(u8, target, player.name)) return true;
        }
        if (std.mem.indexOfScalar(u64, self.targetIDs, player.id) != null) return true;
        if (player.days[day].stars[star] == null) return false;
        return index < self.limit;
    }

    fn shouldPrintDay(self: Options, day: usize) bool {
        if (self.printAllDays) return true;
        return std.mem.indexOfScalar(u32, self.targetDays, @intCast(u32, day)) != null;
    }

    fn compareFunc(self: Options, a: Player, b: Player) bool {
        const comp = switch (self.printOrder) {
            .local => &compareLocal,
            .global => &compareGlobal,
            .stars => &compareStars,
        };
        return comp(a, b);
    }

    fn compareLocal(a: Player, b: Player) bool {
        if (a.local_score != b.local_score) {
            return a.local_score > b.local_score;
        }
        if (a.global_score != b.global_score) {
            return a.global_score > b.global_score;
        }
        if (a.stars != b.stars) {
            return a.stars > b.stars;
        }
        return std.mem.lessThan(u8, a.name, b.name);
    }
    fn compareGlobal(a: Player, b: Player) bool {
        if (a.global_score != b.global_score) {
            return a.global_score > b.global_score;
        }
        if (a.local_score != b.local_score) {
            return a.local_score > b.local_score;
        }
        if (a.stars != b.stars) {
            return a.stars > b.stars;
        }
        return std.mem.lessThan(u8, a.name, b.name);
    }
    fn compareStars(a: Player, b: Player) bool {
        if (a.stars != b.stars) {
            return a.stars > b.stars;
        }
        if (a.local_score != b.local_score) {
            return a.local_score > b.local_score;
        }
        if (a.global_score != b.global_score) {
            return a.global_score > b.global_score;
        }
        return std.mem.lessThan(u8, a.name, b.name);
    }

    fn compareDay(daystar: usize, a: Player, b: Player) bool {
        const day = daystar / 2;
        const star = daystar % 2;

        const astar = a.days[day].stars[star];
        const bstar = b.days[day].stars[star];
        if (astar) |atime| {
            if (bstar) |btime| {
                if (atime != btime) {
                    return atime < btime;
                }
            } else {
                return true;
            }
        } else if (bstar) |_| {
            return false;
        }

        if (a.local_score != b.local_score) {
            return a.local_score > b.local_score;
        }
        if (a.global_score != b.global_score) {
            return a.global_score > b.global_score;
        }
        if (a.stars != b.stars) {
            return a.stars > b.stars;
        }
        return std.mem.lessThan(u8, a.name, b.name);
    }
};

fn printUsage() void {
    @setEvalBranchQuota(10000);
    print(
    \\ Usage: leader [options]
    \\ options:
    \\   -sort [local|global|stars]
    \\     Set the sort mode for players.
    \\     local: points on the zig leaderboard
    \\     global: points on the global leaderboard
    \\     stars: total stars
    \\   -d <day>
    \\     List the top times for each star on the given day.
    \\     Limited by -limit.
    \\   -top
    \\     List the top players.  Default is local.
    \\     Limited by -limit
    \\   -limit <limit>
    \\     Only list the top <limit> players
    \\   -p <name>
    \\     List all times for the player with the given name.
    \\     multiple players may be specified with -p
    \\   -i <id>
    \\     List all times for the player with the given id.
    \\     multiple players may be specified with -p
    \\   -allplayers
    \\     List all times for all players
    \\   -alldays
    \\     List all days
    , .{});
}

fn parseOptions(allocator: std.mem.Allocator) !Options {
    var opts = Options{};
    var badArgs = false;

    var args = try std.process.argsAlloc(allocator);
    // leak the args, we only do parsing once so this is fine,
    // and this means we don't need to dupe strings.

    var players = std.ArrayList([]const u8).init(allocator);
    defer players.deinit();
    var ids = std.ArrayList(u64).init(allocator);
    defer ids.deinit();
    var days = std.ArrayList(u32).init(allocator);
    defer days.deinit();

    var i: usize = 1;
    while (i < args.len) {
        var arg = args[i];
        i += 1;
        if (std.mem.eql(u8, arg, "-p")) {
            if (i < args.len) {
                try players.append(args[i]);
                i += 1;
            } else {
                badArgs = true;
                print("Error: no player name for last argument -p\n", .{});
            }
        } else if (std.mem.eql(u8, arg, "-i")) {
            if (i < args.len) {
                const idStr = args[i];
                i += 1;
                if (std.fmt.parseUnsigned(u64, idStr, 10)) |val| {
                    try ids.append(val);
                } else |err| {
                    badArgs = true;
                    print("Error: Could not parse player ID \"{s}\": {s}\n", .{idStr, @errorName(err)});
                }
            } else {
                badArgs = true;
                print("Error: no player id for last argument -i\n", .{});
            }
        } else if (std.mem.eql(u8, arg, "-d")) {
            if (i < args.len) {
                const dayStr = args[i];
                i += 1;
                if (std.fmt.parseUnsigned(u32, dayStr, 10)) |val| {
                    if (val > 0 and val <= 25) {
                        try days.append(val-1);
                    } else {
                        badArgs = true;
                        print("Error: There are only 25 days, no info for day {}\n", .{val});
                    }
                } else |err| {
                    badArgs = true;
                    print("Error: Could not parse day number \"{s}\": {s}\n", .{dayStr, @errorName(err)});
                }
            } else {
                badArgs = true;
                print("Error: no day number for last argument -d\n", .{});
            }
        } else if (std.mem.eql(u8, arg, "-limit")) {
            if (i < args.len) {
                const limitStr = args[i];
                i += 1;
                if (std.fmt.parseUnsigned(usize, limitStr, 10)) |val| {
                    opts.limit = val;
                } else |err| {
                    badArgs = true;
                    print("Error: Could not parse limit \"{s}\": {s}\n", .{limitStr, @errorName(err)});
                }
            } else {
                badArgs = true;
                print("Error: no limit value for last argument -limit\n", .{});
            }
        } else if (std.mem.eql(u8, arg, "-sort")) {
            if (i < args.len) {
                const sortStr = args[i];
                i += 1;
                if (std.mem.eql(u8, sortStr, "local")) {
                    opts.printOrder = .local;
                } else if (std.mem.eql(u8, sortStr, "global")) {
                    opts.printOrder = .global;
                } else if (std.mem.eql(u8, sortStr, "stars")) {
                    opts.printOrder = .stars;
                } else {
                    badArgs = true;
                    print("Error: Unknown sort option \"{s}\", options are local, global, or stars.\n", .{sortStr});
                }
            } else {
                badArgs = true;
                print("Error: no sort value for last argument -sort\n", .{});
            }
        } else if (std.mem.eql(u8, arg, "-top")) {
            opts.printTopPlayers = true;
        } else if (std.mem.eql(u8, arg, "-allplayers")) {
            opts.printAllPlayers = true;
        } else if (std.mem.eql(u8, arg, "-alldays")) {
            opts.printAllDays = true;
        } else if (std.mem.eql(u8, arg, "help") or
                   std.mem.eql(u8, arg, "-help") or
                   std.mem.eql(u8, arg, "--help")) {
            badArgs = true;
        } else {
            badArgs = true;
            print("Unknown argument: \"{s}\"\n", .{arg});
        }
    }

    if (badArgs) return error.BadArgs;

    opts.targetDays = days.toOwnedSlice();
    opts.targetIDs = ids.toOwnedSlice();
    opts.targetPlayers = players.toOwnedSlice();

    return opts;
}

pub fn main() !void {
    @setEvalBranchQuota(10000);

    const allocator = std.heap.page_allocator;

    const options = parseOptions(allocator) catch |err| switch (err) {
        error.BadArgs => {
            printUsage();
            return;
        },
        else => return err,
    };

    const json = try download.downloadLeaderboard(allocator);
    const players = try parseLeaderboard(json, allocator);

    std.sort.sort(Player, players, options, Options.compareFunc);

    if (options.printTopPlayers) {
        print("Top Players:\n", .{});
        for (players) |*p, i| {
            if (options.shouldPrintTopPlayer(p, i)) {
                print("    {: >2}: {: >2} stars, {: >4} local, {: >2} global: {s} ({})\n",
                    .{i+1, p.stars, p.local_score, p.global_score, p.name, p.id});
            }
        }
        print("\n", .{});
    }

    for (players) |*p, i| {
        if (options.shouldPrintPlayerDetail(p, i)) {
            printAllInfo(p);
            print("\n", .{});
        }
    }

    var day: usize = 0;
    while (day < 25) : (day += 1) {
        if (options.shouldPrintDay(day)) {
            var star: usize = 0;
            while (star < 2) : (star += 1) {
                print("Day {} Star {}:\n", .{day+1, star+1});
                std.sort.sort(Player, players, day * 2 + star, Options.compareDay);
                for (players) |*p, i| {
                    if (options.shouldPrintPlayerTimes(p, i, day, star)) {
                        print("    {: >2}: ", .{i+1});
                        printTime(p.days[day].stars[star], day);
                        print(" {s}\n", .{ p.name });
                    }
                }
            }
            print("\n", .{});
        }
    }
}

fn printAllInfo(p: *const Player) void {
    print("{s} ({}): {} stars, {} local, {} global\n",
        .{p.name, p.id, p.stars, p.local_score, p.global_score});
    for (p.days) |day, j| {
        if (day.stars[0] != null) {
            print("    {: >2}: ", .{j + 1});
            for (day.stars) |star| {
                printTime(star, j);
                print(", ", .{});
            }
            print("\n", .{});
        }
    }
}

fn printTime(time: ?u64, day: usize) void {
    if (time) |ts| {
        const star_signed = @intCast(i64, ts) - (start_year + day_length * @intCast(i64, day));
        var star: u64 = if (star_signed < 0) 0 else @intCast(u64, star_signed);

        const seconds = star % 60;
        star = star / 60;
        const mins = star % 60;
        star = star / 60;
        const hours = star % 24;
        star = star / 24;
        const days = star;

        print("{: >2}:{:0>2}:{:0>2}:{:0>2}", .{days, hours, mins, seconds});
    } else {
        print("--:--:--:--", .{});
    }
}

fn parseLeaderboard(json: []const u8, allocator: std.mem.Allocator) ![]Player {
    var parser = std.json.Parser.init(std.heap.page_allocator, false);
    defer parser.deinit();

    var tree = parser.parse(json) catch |err| {
        print("{s}\n", .{json});
        return err;
    };
    defer tree.deinit();

    var members = tree.root.Object.get("members").?;

    var players = try allocator.alloc(Player, members.Object.count());
    errdefer allocator.free(players);

    std.mem.set(Player, players, .{});

    for (members.Object.values()) |member, i| {
        var p: *Player = &players[i];
        var fields = member.Object.iterator();
        while (fields.next()) |fe| {
            const key = fe.key_ptr.*;
            const value = fe.value_ptr;
            if (std.mem.eql(u8, key, "name")) {
                if (value.* == .String) {
                    p.name = value.String;
                }
            } else if (std.mem.eql(u8, key, "id")) {
                //p.id = try std.fmt.parseUnsigned(u64, value.String, 10);
                p.id = @intCast(u64, value.Integer);
            } else if (std.mem.eql(u8, key, "completion_day_level")) {
                var day_it = value.Object.iterator();
                while (day_it.next()) |day| {
                    const day_key = day.key_ptr.*;
                    const day_value = day.value_ptr;
                    const day_id = try std.fmt.parseUnsigned(usize, day_key, 10);
                    if (day_value.Object.getPtr("1")) |obj| {
                        if (obj.Object.getPtr("get_star_ts")) |star| {
                            p.days[day_id-1].stars[0] = @intCast(u64, star.Integer);//try std.fmt.parseUnsigned(u64, star.String, 10);
                        }
                    }
                    if (day_value.Object.getPtr("2")) |obj| {
                        if (obj.Object.getPtr("get_star_ts")) |star| {
                            p.days[day_id-1].stars[1] = @intCast(u64, star.Integer);//try std.fmt.parseUnsigned(u64, star.String, 10);
                        }
                    }
                }
            } else if (std.mem.eql(u8, key, "local_score")) {
                p.local_score = @intCast(u32, value.Integer);
            } else if (std.mem.eql(u8, key, "global_score")) {
                p.global_score = @intCast(u32, value.Integer);
            } else if (std.mem.eql(u8, key, "stars")) {
                p.stars = @intCast(u32, value.Integer);
            }
        } 
    }

    return players;
}
