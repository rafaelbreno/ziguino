const c = @cImport({
    @cInclude("avr/io.h");
    // @cDefine(comptime name: []u8, value)
    @cDefine("F_CPU", "16000000");
    @cDefine("BLINK_DELAY_MS", "5000");
    // @cDefine("F_CPU", 16000000);
    // @cDefine("BLINK_DELAY_MS", 5000);
    @cInclude("util/delay.h");
});

const print = @import("std").debug.print;

pub fn main() !void {
    c.DDRB |= 0b100000;

    while (1) {
        c.PORTB |= 0b100000;

        c._delay_ms();

        c.PORTB &= ~0b100000;

        c._delay_ms();
    }
}
