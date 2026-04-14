; programa.asm — Laboratorio Post1 Unidad 4
; Propósito: demostrar directivas de sección, datos y constantes en NASM
; ── Constantes (EQU, no reservan memoria)
────────────────────────────────
CR
 EQU 0Dh
 ; Carriage Return
LF
 EQU 0Ah
 ; Line Feed
TERMINADOR EQU 24h
 ; "$" terminador de cadena para DOS
ITERACIONES EQU 5
 ; número de repeticiones del bucle
; ── Datos inicializados
──────────────────────────────────────────────────
section .data
bienvenida db "=== Laboratorio NASM — Unidad 4 ===", CR, LF,
TERMINADOR
separador
 db "----------------------------------------", CR, LF,
TERMINADOR
etiqueta_a db "Variable A (word): ", TERMINADOR
etiqueta_b db "Variable B (dword): ", TERMINADOR
fin_msg
 db "Programa finalizado correctamente.", CR, LF,
TERMINADOR
; Tipos de datos demostrados
var_byte
 db 42
 ; 1 byte con valor 42
var_word
 dw 1234h
 ; 2 bytes con valor 0x1234
var_dword
 dd 0DEADBEEFh
 ; 4 bytes
tabla_bytes db 10, 20, 30, 40, 50 ; 5 bytes consecutivos
; ── Datos no inicializados
───────────────────────────────────────────────
section .bss
buffer
 resb 80
 ; 80 bytes para entrada (no usada aún)
resultado
 resw 1
 ; 1 word para almacenar cálculo
; ── Código ejecutable
────────────────────────────────────────────────────
section .text
global main
main:
; Inicializar registro de segmento de datos
mov ax, @data
 ; valor del segmento .data
mov ds, ax
 ; DS apunta a la sección de datos
; Imprimir mensaje de bienvenida
mov ah, 09h
 ; función DOS: imprimir cadena
mov dx, bienvenida
 ; DX = dirección del mensaje
int 21h
 ; llamar a DOS
