.data
prompt: .asciiz "Ingrese un número: "
result: .asciiz "La serie de Fibonacci es: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Pide al usuario que ingrese un número
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee el número ingresado por el usuario
    li $v0, 5
    syscall
    move $s0, $v0   # Guarda el número ingresado en $s0

    # Inicializa los primeros dos números de la serie de Fibonacci
    li $t0, 0        # Primer número de la serie
    li $t1, 1        # Segundo número de la serie

    # Imprime el primer número de la serie
    li $v0, 1
    move $a0, $t0
    syscall

    # Imprime un espacio en blanco
    li $v0, 4
    la $a0, newline
    syscall

    # Imprime el segundo número de la serie
    li $v0, 1
    move $a0, $t1
    syscall

    # Imprime un espacio en blanco
    li $v0, 4
    la $a0, newline
    syscall

    # Comienza a generar el resto de la serie de Fibonacci
    li $t2, 2  # Inicializa el contador en 2 (ya que ya tenemos dos números de la serie)
loop:
    # Calcula el siguiente número de Fibonacci
    add $t2, $t2, 1   # Incrementa el contador
    add $t3, $t0, $t1 # Suma los dos últimos números de la serie
    move $t0, $t1     # Actualiza el primer número con el segundo
    move $t1, $t3     # Actualiza el segundo número con el resultado

    # Imprime el siguiente número de Fibonacci
    li $v0, 1
    move $a0, $t3
    syscall

    # Imprime un espacio en blanco
    li $v0, 4
    la $a0, newline
    syscall

    # Comprueba si hemos alcanzado el número ingresado por el usuario
    bge $t2, $s0, end_loop

    # Repite el bucle
    j loop

end_loop:
    # Fin del programa
    li $v0, 10
    syscall

