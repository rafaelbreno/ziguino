# Zig

### Summary
1. [About](#about)
2. [Build](#build)
    - How to build this.
3. [Coding](#coding)
    - How I coded this(with explanations)

### About
In this `README.md` you'll see how I implemented the ["Pure C example"](../c/README.md) in Zig.

### Build
1. Updating my setup:
    - > $ yay -Syyu
2. Installing dependencies:
    - > $ yay -S avr-libc
    - > $ yay -S avrdude
    - > $ yay -S avr-gdb
    - > $ yay -S avr-gcc
    - > $ yay -S avr-binutils

### Coding:
1. Created a base Zig project:
    - > $ zig init-exe
