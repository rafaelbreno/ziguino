const regs = @import("atmega328p.zig").registries;

pub fn init(comptime pin: u8, comptime dir: enum { in, out }) void {
    regs.PORTB.DDRB.* = @as(u8, @enumToInt(dir)) << pin;
}

pub fn toggle(comptime pin: u8) void {
    var val = regs.PORTB.DDRB.*;
    val ^= 1 << pin;
    regs.PORTB.DDRB.* = val;
}
