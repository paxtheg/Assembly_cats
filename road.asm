%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor edx, edx
    xor esi, esi
    mov esi, 0
start:
    mov dx, [eax + esi * 4 + point.x]
    cmp dx, [eax + esi * 4 + point.x + 4]
    je dif_Oy
    jne dif_Ox

dif_Oy:
    xor edx, edx
    mov dx, [eax + esi * 4 + point.y]
    cmp dx, [eax + esi * 4 + point.y + 4]
    jge c1_Oy
    jmp c2_Oy

c1_Oy:
    sub dx, [eax + esi * 4 + point.y + 4]
    mov [ebx + esi * 4], edx
    jmp end

c2_Oy:
    xor edx, edx
    mov dx, [eax + esi * 4 + point.y + 4]
    sub dx, [eax + esi * 4 + point.y]
    mov [ebx + esi * 4], edx
    jmp end

dif_Ox:
    xor edx, edx
    mov dx, [eax + esi * 4 + point.x]
    cmp dx, [eax + esi * 4 + point.x + 4]
    jge c1_Ox
    jmp c2_Ox

c1_Ox:
    sub dx, [eax + esi * 4 + point.x + 4]
    mov [ebx + esi * 4], edx
    jmp end

c2_Ox:
    mov dx, [eax + esi * 4 + point.x + 4]
    sub dx, [eax + esi * 4 + point.x]
    mov [ebx + esi * 4], edx
    jmp end


end:
    add esi, 1
    cmp esi, ecx
    jl start


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY