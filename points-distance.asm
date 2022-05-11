%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor ecx, ecx
    xor edx, edx
    mov cx, word[ebx + point.x]
    mov dx, word[ebx + 4 + point.x]
    cmp cx, dx
    je dif_Oy
    jne dif_Ox
dif_Oy:
    xor ecx, ecx
    xor edx, edx
    mov cx, word[ebx + point.y]
    mov dx, word[ebx + 4 + point.y]
    cmp cx, dx
    jge c1_Oy
    jmp c2_Oy
c1_Oy:
    sub cx, dx
    mov [eax], ecx
    jmp end
c2_Oy:
    sub dx, cx
    mov [eax], edx
    jmp end
 
dif_Ox:
    cmp cx, dx
    jge c1_Ox
    jmp c2_Ox
c1_Ox:
    sub cx, dx
    mov [eax], ecx
    jmp end
c2_Ox:
    sub dx, cx
    mov [eax], edx
    jmp end   


end:
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY