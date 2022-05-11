%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:

    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    xor esi, esi
    mov esi, eax
    dec esi
start:
    add edx, 1
    cmp dword[ebx + 4 * esi], 0
    je zero 
    push edx
    mov eax, edx
    mul edx
    pop edx
    cmp eax, [ebx + 4 * esi]
    jg no_pp
    je pp
    jl start
no_pp:
    mov dword[ecx + 4 * esi], 0
    jmp end
pp:
    mov dword[ecx + 4 * esi], 1
    jmp end
zero:
    mov dword[ecx + 4 * esi], 1
    jmp end

end:
    sub esi, 1
    xor edx, edx
    cmp esi, 0
    jge start

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY