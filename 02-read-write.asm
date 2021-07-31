          global    _main

          section   .text                   ; program
_main:    mov       rax, 0x02000003         ; system call for read
          mov       rdi, 0                  ; arg1 - 0 = stdin
          mov       rsi, num1               ; arg2 - address of string to output
          mov       rdx, 4                  ; arg3 - number of bytes
          syscall                           ; invoke

          mov       rax, 0x02000004         ; system call for write
          mov       rdi, 1                  ; arg1 - 1 = stdout
                                            ; arg2 - address of string to output
          mov       rdx, 4                  ; arg3 - number of bytes
          syscall                           ; invoke

          mov       rax, 0x02000001         ; system call for exit
          mov       rdi, 0                  ; arg1 - exit code 0
          syscall                           ; invoke

          section   .data
message:  db        "Hello, World", 0       ; 0 represents \0

          section .bss
	
          num1 resb 4                       ; resever 4 bytes