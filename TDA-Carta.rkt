#lang racket


(provide carta
         carta?
         carta-get-id
         carta-get-tipo
         carta-get-descripcion
         carta-get-accion)


(define carta
  (lambda (id tipo descripcion accion)
    (list id tipo descripcion accion)))


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


(define carta-get-id first)


(define carta-get-tipo second)


(define carta-get-descripcion third)


(define carta-get-accion fourth)