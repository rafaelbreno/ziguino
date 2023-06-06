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

#### Summary:
1. [Example in Pure C](./c/README.md)
1. [Zig implementation](./zig/README.md)
