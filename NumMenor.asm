.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result_msg: .asciiz "El número menor es: "
newline: .asciiz "\n"

.text
main:
    # Pide al usuario que ingrese el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Lee el primer número
    li $v0, 5
    syscall
    move $s0, $v0 # Guarda el primer número en $s0
    
    # Pide al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Lee el segundo número
    li $v0, 5
    syscall
    move $s1, $v0 # Guarda el segundo número en $s1
    
    # Pide al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    
    # Lee el tercer número
    li $v0, 5
    syscall
    move $s2, $v0 # Guarda el tercer número en $s2
    
    # Encuentra el menor número
    move $t0, $s0 # Inicializa el menor número con el primer número
    
    # Compara con el segundo número
    slt $t1, $s1, $t0
    beq $t1, 1, update_min1
    
    # Compara con el tercer número
    slt $t1, $s2, $t0
    beq $t1, 1, update_min2
    j print_result
    
update_min1:
    move $t0, $s1 # Actualiza el menor número con el segundo número
    j update_min2
    
update_min2:
    move $t0, $s2 # Actualiza el menor número con el tercer número
    
print_result:
    # Imprime el mensaje "El número menor es: "
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Imprime el número menor
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Imprime un salto de línea
    li $v0, 4
    la $a0, newline
    syscall
    
    # Salir del programa
    li $v0, 10
    syscall


