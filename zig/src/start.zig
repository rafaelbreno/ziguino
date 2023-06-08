const std = @import("std");
const builtin = std.builtin;

pub export fn _start() callconv(.Naked) noreturn {
    while (true) {}
}

pub fn panic(_: []const u8, _: ?*builtin.StackTrace, _: ?usize) noreturn {
    // Currently assumes that the uart is initialized in main().
    while (true) {}
}

export fn _unhandled_vector() void {
    while (true) {}
}
