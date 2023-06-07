const std = @import("std");
const Build = std.Build;
const CrossTarget = std.zig.CrossTarget;
const Target = std.Target;

pub fn build(b: *Build) void {
    // the target that we're building to:
    const target = CrossTarget{
        .cpu_arch = Target.Cpu.Arch.avr,
        .cpu_model = .{
            //.explicit = &Target.avr.cpu.atmega88p,
            .explicit = &Target.avr.cpu.atmega328p,
        },
        .os_tag = Target.Os.Tag.freestanding,
        .abi = .none,
    };

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = .ReleaseSafe;

    const exe = b.addExecutable(.{
        .name = "ziguino",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/start.zig" },
        // the target that we declared:
        .target = target,
        .optimize = optimize,
    });

    exe.setLinkerScriptPath(std.build.FileSource{ .path = "src/linker.ld" });
    exe.install(); // zig build

    const tty = b.option([]const u8, "tty", "Specify Arduino's port | default : /dev/ttyACM0") orelse "/dev/ttyACM0";

    const bin_path = b.getInstallPath(exe.install_step.?.dest_dir, exe.out_filename);

    const flash_command = b.fmt("-Uflash:w: {s} :e", .{bin_path});

    const upload = b.step(
        "upload",
        "Upload the code to an Arduino device using avrdude",
    );

    const avrdude = b.addSystemCommand(&.{
        "avrdude",
        "-carduino",
        "-patmega328p",
        "-D",
        "-P",
        tty,
        flash_command,
    });

    upload.dependOn(&avrdude.step);
    avrdude.step.dependOn(&exe.install_step.?.step);

    const objdump = b.step(
        "objdump",
        "Show dissassembly of the code using avr-objdump",
    );

    const avr_objdump = b.addSystemCommand(&.{
        "avr-objdump",
        "-dh",
        bin_path,
    });
    objdump.dependOn(&avr_objdump.step);
    avr_objdump.step.dependOn(&exe.install_step.?.step);

    const monitor = b.step(
        "monitor",
        "Opens monitor to the serial output",
    );
    const screen = b.addSystemCommand(&.{
        "screen",
        tty,
        "115200", // TODO: WTF IS THIS?
    });

    monitor.dependOn(&screen.step);
    b.default_step.dependOn(&exe.step);
}
