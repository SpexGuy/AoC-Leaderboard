const std = @import("std");
const w = std.os.windows;
const ULONG = w.ULONG;
const DWORD = w.DWORD;
const WORD = w.WORD;
const LPSTR = w.LPSTR;
const LPCSTR = w.LPCSTR;
const LPWSTR = w.LPWSTR;
const LPCVOID = w.LPCVOID;
const LPVOID = w.LPVOID;
const WINAPI = w.WINAPI;

const wide = std.unicode.utf8ToUtf16LeStringLiteral;

const wh = @import("winhttp");

extern "kernel32" fn LocalFree(*c_void) callconv(WINAPI) ?*c_void;
extern "kernel32" fn GetLastError() callconv(WINAPI) DWORD;
extern "kernel32" fn FormatMessageA(
    dwFlags: DWORD,
    lpSource: ?LPCVOID,
    dwMessageId: DWORD,
    dwLanguageId: DWORD,
    lpBuffer: ?LPSTR,
    nSize: DWORD,
    args: ?*c_void,
) callconv(WINAPI) DWORD;
extern "kernel32" fn FormatMessageW(
    dwFlags: DWORD,
    lpSource: ?LPCVOID,
    dwMessageId: DWORD,
    dwLanguageId: DWORD,
    lpBuffer: ?LPWSTR,
    nSize: DWORD,
    args: ?*c_void,
) callconv(WINAPI) DWORD;
inline fn MAKELANGID(p: WORD, s: WORD) DWORD {
    return (@as(DWORD, s) << 10) | @as(DWORD, p);
}

const LANG_NEUTRAL = 0;
const SUBLANG_DEFAULT = 1;
const DEFAULT_LANG = MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT);

fn printWindowsError(context: []const u8) void {
    const messageID = GetLastError();

    var needsCleanup = false;
    var message: []const u8 = "(no message)";
    defer if (needsCleanup) {
        _ = LocalFree(@intToPtr(LPVOID, @ptrToInt(message.ptr)));
    };

    if (messageID != 0) {
        var ptr: ?[*:0]const u8 = null;
        const result = FormatMessageA(
            w.FORMAT_MESSAGE_ALLOCATE_BUFFER | w.FORMAT_MESSAGE_FROM_SYSTEM | w.FORMAT_MESSAGE_IGNORE_INSERTS,
            null, messageID, DEFAULT_LANG, @ptrCast(w.LPSTR, &ptr), 0, null);
        if (result == 0) {
            printWindowsError("FormatMessageA");
        } else if (ptr) |p| {
            message = std.mem.span(p);
            needsCleanup = true;
        }
    }
    std.debug.print("{s} failed, error={s}, code={}\n", .{context, message, messageID});
}

pub fn downloadLeaderboard(allocator: *std.mem.Allocator) ![]const u8 {
    @setEvalBranchQuota(10000);

    const session = wh.Open(
        wide("ziggy"),
        wh.ACCESS_TYPE_AUTOMATIC_PROXY,
        wh.NO_PROXY_NAME,
        wh.NO_PROXY_BYPASS,
        0,
    );
    if (session == null) {
        printWindowsError("session null");
        return error.InternetError;
    }
    defer _ = wh.CloseHandle(session);

    const conn = wh.Connect(
        session,
        wide("adventofcode.com"),
        wh.INTERNET_DEFAULT_HTTPS_PORT,
        0,
    );
    if (conn == null) {
        printWindowsError("conn null");
        return error.InternetError;
    }
    defer _ = wh.CloseHandle(conn);

    const request = wh.OpenRequest(
        conn,
        wide("GET"),
        wide("/2021/leaderboard/private/view/384812.json"),
        null,
        wide("https://adventofcode.com/2021/leaderboard/private/view/384812"),
        wh.DEFAULT_ACCEPT_TYPES,
        wh.FLAG_SECURE,
    );
    if (request == null) {
        printWindowsError("request null");
        return error.InternetError;
    }
    defer _ = wh.CloseHandle(request);

    @compileError("Insert your session token below, then delete this line.");
    var success = wh.AddRequestHeaders(
        request,
        wide("Cookie: session=<your session here>"),
        ~@as(ULONG, 0),
        wh.ADDREQ_FLAG_ADD,
    );
    if (success == 0) {
        printWindowsError("AddRequestHeaders");
        return error.InternetError;
    }

    success = wh.SendRequest(
        request,
        wh.NO_ADDITIONAL_HEADERS,
        0,
        wh.NO_REQUEST_DATA,
        0,
        0,
        0,
    );
    if (success == 0) {
        printWindowsError("SendRequest failed");
        return error.InternetError;
    }

    success = wh.ReceiveResponse(request, null);
    if (success == 0) {
        printWindowsError("ReceiveResponse failed");
        return error.InternetError;
    }

    {
        var status: DWORD = 0;
        var size: DWORD = @sizeOf(DWORD);
        success = wh.QueryHeaders(
            request,
            wh.QUERY_STATUS_CODE | wh.QUERY_FLAG_NUMBER,
            null,
            &status,
            &size,
            wh.NO_HEADER_INDEX,
        );
        if (success == 0) {
            printWindowsError("QueryHeaders");
            return error.InternetError;
        }
        //std.debug.print("Status: {}, Size: {}\n", .{status, size});
    }

    var data = std.ArrayList(u8).init(allocator);
    defer data.deinit();

    try data.ensureCapacity(64 * 1024);

    while (true) {
        var size: DWORD = 0;
        if (wh.QueryDataAvailable(request, &size) == 0) {
            printWindowsError("QueryDataAvailable");
            return error.InternetError;
        }

        if (size == 0) break;

        const start = data.items.len;
        try data.appendNTimes(undefined, size);

        var downloaded: DWORD = 0;
        if (wh.ReadData(request, data.items.ptr + start, size, &downloaded) == 0) {
            printWindowsError("ReadData");
            return error.InternetError;
        } else {
            data.items.len = start + downloaded;
        }
    }

    return data.toOwnedSlice();
}