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

; Descripción: Construir el TDA Tablero
; Dom: propiedades (lista) X cartas-suerte (lista) X cartas-comunidad (lista) X casillas-especiales (lista)
; Rec: tablero
; Tipo recursión: No aplica
(define tablero
  (lambda (propiedades cartas-suerte cartas-comunidad casillas-especiales)
    (list propiedades cartas-suerte cartas-comunidad casillas-especiales)))

; Descripción: Verificar si un elemento es un tablero
; Dom: elemento (any)
; Rec: boolean
; Tipo recursión: No aplica
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

; Descripción: Obtener las propiedades del tablero
; Dom: tablero (tablero)
; Rec: lista de propiedades con posición (lista de pares (propiedad . posicion))
; Tipo recursión: No aplica
(define tablero-get-propiedades first)

; Descripción: Obtener las cartas de suerte del tablero
; Dom: tablero (tablero)
; Rec: lista de cartas
; Tipo recursión: No aplica
(define tablero-get-cartas-suerte second)

; Descripción: Obtener las cartas de comunidad del tablero
; Dom: tablero (tablero)
; Rec: lista de cartas
; Tipo recursión: No aplica
(define tablero-get-cartas-comunidad third)

; Descripción: Obtener las casillas especiales del tablero
; Dom: tablero (tablero)
; Rec: lista de casillas especiales (lista de pares (tipo . posicion))
; Tipo recursión: No aplica
(define tablero-get-casillas-especiales fourth)

; Descripción: Modificar las propiedades del tablero
; Dom: tablero (tablero) X propiedades (lista de propiedades con posición)
; Rec: tablero
; Tipo recursión: No aplica
(define tablero-set-propiedades
  (lambda (tablero propiedades)
    (list propiedades
          (tablero-get-cartas-suerte tablero)
          (tablero-get-cartas-comunidad tablero)
          (tablero-get-casillas-especiales tablero))))

; Descripción: Modificar las cartas de suerte del tablero
; Dom: tablero (tablero) X cartas-suerte (lista de cartas)
; Rec: tablero
; Tipo recursión: No aplica
(define tablero-set-cartas-suerte
  (lambda (tablero cartas-suerte)
    (list (tablero-get-propiedades tablero)
          cartas-suerte
          (tablero-get-cartas-comunidad tablero)
          (tablero-get-casillas-especiales tablero))))

; Descripción: Modificar las cartas de comunidad del tablero
; Dom: tablero (tablero) X cartas-comunidad (lista de cartas)
; Rec: tablero
; Tipo recursión: No aplica
(define tablero-set-cartas-comunidad
  (lambda (tablero cartas-comunidad)
    (list (tablero-get-propiedades tablero)
          (tablero-get-cartas-suerte tablero)
          cartas-comunidad
          (tablero-get-casillas-especiales tablero))))

; Descripción: Modificar las casillas especiales del tablero
; Dom: tablero (tablero) X casillas-especiales (lista de casillas especiales)
; Rec: tablero
; Tipo recursión: No aplica
(define tablero-set-casillas-especiales
  (lambda (tablero casillas-especiales)
    (list (tablero-get-propiedades tablero)
          (tablero-get-cartas-suerte tablero)
          (tablero-get-cartas-comunidad tablero)
          casillas-especiales)))

; Descripción: Obtener la propiedad ubicada en una posición específica del tablero
; Dom: tablero (tablero) X posicion (int)
; Rec: propiedad o null
; Tipo recursión: Natural
(define tablero-get-propiedad-en-posicion
  (lambda (tablero posicion)
    (define encontrar
      (lambda (lista pos)
        (cond
          [(null? lista) null]
          [(= (cdr (first lista)) pos) (car (first lista))]
          [else (encontrar (rest lista) pos)])))
    
    (encontrar (tablero-get-propiedades tablero) posicion)))


; RF07. TDA Tablero - modificador - Agregar propiedad.  
; Dom:    tablero (tablero)  
;         propiedades con posición (lista de pares (propiedad . posición))  
; Rec:    tablero  
; Recursión: cola
(define (tablero-agregar-propiedad t lista-propiedades)
  (if (null? lista-propiedades)
      t
      (let* ([par          (car lista-propiedades)]   
             [props-vec   (tablero-get-propiedades t)]
             [props-nuev  (cons par props-vec)]       
             [t2          (tablero                    
                            props-nuev
                            (tablero-get-cartas-suerte t)
                            (tablero-get-cartas-comunidad t)
                            (tablero-get-casillas-especiales t))])
        (tablero-agregar-propiedad t2 (cdr lista-propiedades)))))

