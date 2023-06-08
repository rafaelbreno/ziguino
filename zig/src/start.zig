const std = @import("std");
const builtin = std.builtin;
const lib = @import("lib/lib.zig");
const gpio = lib.gpio;
const delay_ms = lib.delay.delay_ms;

comptime {
    var asm_str: []const u8 = ".section .vectors\njmp _start\n";
    asm (asm_str);
}

pub export fn _start() callconv(.Naked) noreturn {
    gpio.init(5, .out);

    while (true) {
        gpio.toggle(5);
        delay_ms(1000);
    }

    unreachable;
}

pub fn panic(_: []const u8, _: ?*builtin.StackTrace, _: ?usize) noreturn {
    // Currently assumes that the uart is initialized in main().
    while (true) {}
}

export fn _unhandled_vector() void {
    while (true) {}
}
