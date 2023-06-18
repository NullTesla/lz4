const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addSharedLibrary(.{
        .name = "lz4",
        .target = target,
        .optimize = optimize,
    });
    const lz4dir = "lib\\";

    lib.linkLibC();
    lib.addIncludePath(lz4dir);
    lib.addCSourceFiles(
        &.{
            lz4dir ++ "lz4.c",
            lz4dir ++ "lz4file.c",
            lz4dir ++ "lz4frame.c",
            lz4dir ++ "lz4hc.c",
            lz4dir ++ "xxhash.c",
        },
        &.{},
    );

    b.installArtifact(lib);
}
