          global    _main
          section   .text
_main:
          mov       rdx, output             ; rdx holds address of next byte to write
firststar:
          mov       word [rdx], '*'         ; write single star
          inc       rdx                     ; advance pointer to next cell to write
secondstar:
          mov       word [rdx], '*'         ; write single star
          inc       rdx                     ; advance pointer to next cell to write
thirdstar:
          mov       byte [rdx], '*'         ; write single star
          inc       rdx                     ; advance pointer to next cell to write
fourstar:
          mov       byte [rdx], '*'         ; write single star
          inc       rdx                     ; advance pointer to next cell to write
newline:
          mov       byte [rdx], 10          ; new line
          inc       rdx                     ; advance pointer to next cell to write
done:
          mov       rax, 0x02000004         
          mov       rdi, 1                  
          mov       rsi, output             
          mov       rdx, dataSize           
          syscall                           

          mov       rax, 0x02000001         ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .bss
dataSize  equ       5
output:   resb      dataSize