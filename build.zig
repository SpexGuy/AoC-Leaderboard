const std = @import("std");
const path = std.fs.path;
const Builder = std.build.Builder;
const LibExeObjStep = std.build.LibExeObjStep;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    const exe = b.addExecutable("leader", "src/main.zig");
    setDependencies(b, exe, mode, target);
    exe.install();

    const run_step = b.step("run", "Run the project");
    const run_cmd = exe.run();
    run_step.dependOn(&run_cmd.step);
    if (b.args) |args| run_cmd.addArgs(args);

    const vscode_exe = b.addExecutable("vscode", "src/main.zig");
    setDependencies(b, vscode_exe, mode, target);

    const vscode_install = b.addInstallArtifact(vscode_exe);

    const vscode_step = b.step("vscode", "Build for VSCode");
    vscode_step.dependOn(&vscode_install.step);
}

fn setDependencies(b: *Builder, step: *LibExeObjStep, mode: anytype, target: anytype) void {
    _ = b;
    step.setBuildMode(mode);
    step.setTarget(target);
    step.linkLibC();
    step.addPackagePath("winhttp", "include/winhttp.zig");
}
