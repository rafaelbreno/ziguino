const cpu = @import("cpu.zig");

const cyclesPerMs: u32 = cpu.F_CPU / 10000;

pub fn delay_ms(ms: u32) void {
    var count: u32 = 0;
    var cycles: u32 = ms * cyclesPerMs;
    while (count < cycles) : (count += 1) {
        asm volatile ("nop");
    }
}
