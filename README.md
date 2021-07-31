# Hello assembly

```bash
nasm -f macho64 64.asm

ld -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib \
  -lSystem \
  -macosx_version_min 10.12 \
  -no_pie \
  -o hello \
  hello.o

./hello
```

Registers for syscall arguments: rdi, rsi, rdx, rcx, r8, r9
https://en.wikipedia.org/wiki/X86_calling_conventions#x86-64_Calling_Conventions
