          global    _main
          section   .text
_main:
          mov       rdx, output             ; rdx holds address of next byte to write
          mov       r8, 0                   ; r8 holds the number of stars
writeStar:
          mov       byte [rdx], '*'         ; write single star
          inc       rdx                     ; advance pointer to next cell to write
          inc       r8                      ; increment number of stars
          cmp       r8, stars               ; is the number of stars equals what we want?
          jne       writeStar               ; if not, go back to the beginning
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
stars     equ       4
dataSize  equ       5
output:   resb      dataSize