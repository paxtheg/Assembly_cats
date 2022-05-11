%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
start:
    mov byte al, [esi + ecx - 1]
    mov byte [edi + ecx - 1], al
    add dword [edi + ecx - 1], edx
    cmp byte [edi + ecx - 1], 'Z'
    jg dif
    jmp end
dif:
    sub byte [edi + ecx - 1], 26
end:
    loop start    



    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
