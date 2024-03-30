.data
prompt: .asciiz "Ingrese un número: "
result_msg: .asciiz "El número mayor es: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Imprimir el mensaje para el primer número
    li $v0, 4             # código de llamada al sistema para imprimir cadena
    la $a0, prompt        # cargar la dirección de la cadena del mensaje
    syscall

    # Leer el primer número
    li $v0, 5             # código de llamada al sistema para leer un entero
    syscall
    move $t0, $v0         # almacenar el primer número en $t0

    # Imprimir el mensaje para el segundo número
    li $v0, 4             # código de llamada al sistema para imprimir cadena
    la $a0, prompt        # cargar la dirección de la cadena del mensaje
    syscall

    # Leer el segundo número
    li $v0, 5             # código de llamada al sistema para leer un entero
    syscall
    move $t1, $v0         # almacenar el segundo número en $t1

    # Imprimir el mensaje para el tercer número
    li $v0, 4             # código de llamada al sistema para imprimir cadena
    la $a0, prompt        # cargar la dirección de la cadena del mensaje
    syscall

    # Leer el tercer número
    li $v0, 5             # código de llamada al sistema para leer un entero
    syscall
    move $t2, $v0         # almacenar el tercer número en $t2

    # Comparar $t0 y $t1 para encontrar el máximo
    bgt $t0, $t1, check_t2   # saltar si $t0 > $t1
    move $t3, $t1            # almacenar $t1 como máximo
    j print_result            # saltar a imprimir el resultado

check_t2:
    move $t3, $t0            # almacenar $t0 como máximo
    move $t0, $t1            # actualizar $t0 a $t1 para comparación
    move $t1, $t3            # actualizar $t1 a $t3 (máximo) para comparación

    # Comparar $t3 (máximo) con $t2
    bgt $t3, $t2, print_result   # saltar si $t3 > $t2
    move $t3, $t2                # almacenar $t2 como máximo

print_result:
    # Imprimir el mensaje "El número mayor es: "
    li $v0, 4               # código de llamada al sistema para imprimir cadena
    la $a0, result_msg      # cargar dirección de la cadena del mensaje de resultado
    syscall

    # Imprimir el número máximo
    li $v0, 1               # código de llamada al sistema para imprimir un entero
    move $a0, $t3           # cargar el número máximo para imprimir
    syscall

    # Imprimir un salto de línea
    li $v0, 4               # código de llamada al sistema para imprimir cadena
    la $a0, newline         # cargar la dirección de la cadena de salto de línea
    syscall

    # Salir del programa
    li $v0, 10              # código de llamada al sistema para salir
    syscall


