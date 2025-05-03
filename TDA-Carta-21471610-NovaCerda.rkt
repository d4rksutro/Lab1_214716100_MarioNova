#lang racket

(provide carta
         carta?
         carta-get-id
         carta-get-tipo
         carta-get-descripcion
         carta-get-accion)

; Descripción: Construir el TDA Carta
; Dom: id (int) X tipo (string) X descripcion (string) X accion (funcion)
; Rec: carta
; Tipo recursión: No aplica
(define carta
  (lambda (id tipo descripcion accion)
    (list id tipo descripcion accion)))

; Descripción: Verificar si un elemento es una carta válida
; Dom: elemento (any)
; Rec: boolean
; Tipo recursión: No aplica
(define carta?
  (lambda (elemento)
    (if (list? elemento)
        (if (= (length elemento) 4)
            (and (number? (first elemento))
                 (string? (second elemento))
                 (string? (third elemento))
                 (or (procedure? (fourth elemento))
                     (symbol? (fourth elemento))))
            #f)
        #f)))

; Descripción: Obtener el ID de la carta
; Dom: carta (carta)
; Rec: int
; Tipo recursión: No aplica
(define carta-get-id first)

; Descripción: Obtener el tipo de la carta
; Dom: carta (carta)
; Rec: string
; Tipo recursión: No aplica
(define carta-get-tipo second)

; Descripción: Obtener la descripción de la carta
; Dom: carta (carta)
; Rec: string
; Tipo recursión: No aplica
(define carta-get-descripcion third)

; Descripción: Obtener la acción de la carta
; Dom: carta (carta)
; Rec: función o símbolo
; Tipo recursión: No aplica
(define carta-get-accion fourth)