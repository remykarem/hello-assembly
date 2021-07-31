; ----------------------------------------------------------------------------------------
; nasm -f macho64 64.asm
;
; ld -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib \
;   -lSystem \
;   -macosx_version_min 10.12 \
;   -no_pie \
;   -o hello \
;   hello.o
;
; ./hello
;
; Registers for syscall arguments: rdi, rsi, rdx, rcx, r8, r9
; https://en.wikipedia.org/wiki/X86_calling_conventions#x86-64_Calling_Conventions
; ----------------------------------------------------------------------------------------

          global    _main

          section   .text                   ; program
_main:    mov       rax, 0x02000004          ; system call for write
          mov       rdi, 1                  ; arg1 - 1 = stdout
          mov       rsi, message            ; arg2 - address of string to output
          mov       rdx, 13                 ; arg3 - number of bytes
          syscall                           ; invoke operating system

          mov       rax, 0x02000001         ; system call for exit
          mov       rdi, 0                  ; arg1 - exit code 0
          syscall                           ; invoke operating system

          section   .data
message:  db        "Hello, World", 0      ; 10 represent the newline at the end
