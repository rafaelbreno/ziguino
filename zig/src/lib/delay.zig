const cpu = @import("cpu.zig");

pub fn delay_ms(ms: u32) void {
    var iterations: u64 = @as(u64, ms) * (cpu.F_CPU / 1000);
    var iter: usize = @ptrToInt(&iterations);
    for (iter) |_| {
        // inline assembly
        //  - asm - Defines the inline assembly
        //  - `volatile` is an optional modifier that tells Zig this
        //      inline assembly expression has side-effects. Without
        //      `volatile`, Zig is allowed to delete the inline assembly
        //      code if the result is unused.
        asm volatile (
            \\ nop
        );
    }
}
