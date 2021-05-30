;
; BOOT SECTOR
;
[org 0x7C00]

mov ah, 0x0E
mov bx, BOOT_MSG
call print_str
hlt

; Print null terminated string
print_str:
mov al, [bx]
cmp al, 0
jne print_char
ret

; Print character
print_char:
int 0x10
inc bx
jmp print_str

; Boot message
BOOT_MSG:
db '...BOOTTING...', 0

times 510 - ($ - $$) db 0

; Magic boot sector signature
dw 0xAA55
