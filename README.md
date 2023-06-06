# ziguino
Zig + Arduino = Ziguino

I want to write this:
```arduino
void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000);
}
```

But in Zig.

### Step-by-step(In ArchLinux):
1. Updating my setup:
    - > $ yay -Syyu
2. Installing dependencies:
    - > $ yay -S avr-libc
    - > $ yay -S avrdude
    - > $ yay -S avr-gdb
    - > $ yay -S avr-gcc
    - > $ yay -S avr-binutils
