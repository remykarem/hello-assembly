          global    _main

          section   .text                   ; program
_main:    mov       rax, 0x02000004         ; system call for write
          mov       rdi, 1                  ; arg1 - 1 = stdout
          mov       rsi, qn1                ; arg2 - address of string to output
          mov       rdx, qn1_len            ; arg3 - number of bytes
          syscall                           ; invoke

          mov       rax, 0x02000003         ; system call for read
          mov       rdi, 0                  ; arg1 - 0 = stdin
          mov       rsi, num1               ; arg2 - address of string to output
          mov       rdx, 4                  ; arg3 - number of bytes
          syscall                           ; invoke

          ; something wrong here
          mov       ebx, [num1]
          sub       rbx, '0'                ; convert from ASCII to decimal
          add       rbx, 0x10
          add       rbx, '0'                ; convert from decimal to ASCII
          mov rsi, rbx

          mov       rax, 0x02000004         ; system call for write
          mov       rdi, 1                  ; arg1 - 1 = stdout
                                            ; arg2 - address of string to output
          mov       rdx, 4                  ; arg3 - number of bytes
          syscall                           ; invoke

          mov       rax, 0x02000001         ; system call for exit
          mov       rdi, 0                  ; arg1 - exit code 0
          syscall                           ; invoke

          section   .data
qn1:      db        "Enter first number: ", 10    ; 10 represent the newline at the end
qn1_len:  equ       $ - qn1
qn2:      db        "Enter second number: ", 10    ; 10 represent the newline at the end
qn2_len:  equ       $ - qn2

          section .bss
          num1 resb 8                       ; reseverve 4 bytes
          result resb 2                        ; reseverve 4 bytes