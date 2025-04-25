#lang racket

(provide tablero
         tablero?
         tablero-get-propiedades
         tablero-get-cartas-suerte
         tablero-get-cartas-comunidad
         tablero-get-casillas-especiales
         tablero-set-propiedades
         tablero-set-cartas-suerte
         tablero-set-cartas-comunidad
         tablero-set-casillas-especiales
         tablero-get-propiedad-en-posicion
         tablero-agregar-propiedad)

(define tablero
  (lambda (propiedades cartas-suerte cartas-comunidad casillas-especiales)
    (list propiedades cartas-suerte cartas-comunidad casillas-especiales)))


(define tablero?
  (lambda (elemento)
    (if (list? elemento)
        (if (= (length elemento) 4)
            (and (list? (first elemento))
                 (list? (second elemento))
                 (list? (third elemento))
                 (list? (fourth elemento)))
            #f)
        #f)))


(define tablero-get-propiedades first)


(define tablero-get-cartas-suerte second)

(define tablero-get-cartas-comunidad third)


(define tablero-get-casillas-especiales fourth)


(define tablero-set-propiedades
  (lambda (tablero propiedades)
    (list propiedades
          (tablero-get-cartas-suerte tablero)
          (tablero-get-cartas-comunidad tablero)
          (tablero-get-casillas-especiales tablero))))

(define tablero-set-cartas-suerte
  (lambda (tablero cartas-suerte)
    (list (tablero-get-propiedades tablero)
          cartas-suerte
          (tablero-get-cartas-comunidad tablero)
          (tablero-get-casillas-especiales tablero))))


(define tablero-set-cartas-comunidad
  (lambda (tablero cartas-comunidad)
    (list (tablero-get-propiedades tablero)
          (tablero-get-cartas-suerte tablero)
          cartas-comunidad
          (tablero-get-casillas-especiales tablero))))


(define tablero-set-casillas-especiales
  (lambda (tablero casillas-especiales)
    (list (tablero-get-propiedades tablero)
          (tablero-get-cartas-suerte tablero)
          (tablero-get-cartas-comunidad tablero)
          casillas-especiales)))


(define tablero-get-propiedad-en-posicion
  (lambda (tablero posicion)
    (define encontrar
      (lambda (lista pos)
        (cond
          [(null? lista) null]
          [(= (cdr (first lista)) pos) (car (first lista))]
          [else (encontrar (rest lista) pos)])))
    
    (encontrar (tablero-get-propiedades tablero) posicion)))


(define tablero-agregar-propiedad
  (lambda (tablero propiedad-con-posicion)
    (tablero-set-propiedades 
     tablero 
     (cons propiedad-con-posicion (tablero-get-propiedades tablero)))))