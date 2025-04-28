#lang racket

(provide jugador
         jugador?
         jugador-get-id
         jugador-get-nombre
         jugador-get-dinero
         jugador-get-propiedades
         jugador-get-posicion
         jugador-get-esta-en-carcel
         jugador-get-cartas-salir-carcel
         jugador-set-dinero
         jugador-set-posicion
         jugador-set-esta-en-carcel
         jugador-set-cartas-salir-carcel
         jugador-agregar-propiedad
         jugador-quitar-propiedad
         jugador-mover
         jugador-comprar-propiedad
         jugador-pagar-renta
         jugador-esta-en-bancarrota)


(require "TDA-Propiedad.rkt")

; Descripción: Construir el TDA Jugador
; Dom: id (int) X nombre (string) X dinero (int) X propiedades (list de ids) X posicion (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador
  (lambda (id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
    (list id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)))

; Descripción: Verificar si un elemento es un jugador
; Dom: elemento (any)
; Rec: boolean
; Tipo recursión: No aplica
(define jugador?
  (lambda (elemento)
    (if (list? elemento)
        (if (= (length elemento) 7)
            (and (number? (first elemento))
                 (string? (second elemento))
                 (number? (third elemento))
                 (list? (fourth elemento))
                 (number? (fifth elemento))
                 (boolean? (sixth elemento))
                 (number? (seventh elemento)))
            #f)
        #f)))

; Descripción: Obtener el ID del jugador
; Dom: jugador (jugador)
; Rec: int
; Tipo recursión: No aplica
(define jugador-get-id
  (lambda (jugador)
    (first jugador)))

; Descripción: Obtener el nombre del jugador
; Dom: jugador (jugador)
; Rec: string
; Tipo recursión: No aplica
(define jugador-get-nombre
  (lambda (jugador)
    (second jugador)))

; Descripción: Obtener el dinero del jugador
; Dom: jugador (jugador)
; Rec: int
; Tipo recursión: No aplica
(define jugador-get-dinero
  (lambda (jugador)
    (third jugador)))

; Descripción: Obtener las propiedades del jugador (lista de IDs)
; Dom: jugador (jugador)
; Rec: lista de IDs de propiedades
; Tipo recursión: No aplica
(define jugador-get-propiedades
  (lambda (jugador)
    (fourth jugador)))

; Descripción: Obtener la posición del jugador en el tablero
; Dom: jugador (jugador)
; Rec: int
; Tipo recursión: No aplica
(define jugador-get-posicion
  (lambda (jugador)
    (fifth jugador)))

; Descripción: Obtener si el jugador está en la cárcel
; Dom: jugador (jugador)
; Rec: boolean
; Tipo recursión: No aplica
(define jugador-get-esta-en-carcel
  (lambda (jugador)
    (sixth jugador)))

; Descripción: Obtener el número de cartas para salir de la cárcel
; Dom: jugador (jugador)
; Rec: int
; Tipo recursión: No aplica
(define jugador-get-cartas-salir-carcel
  (lambda (jugador)
    (seventh jugador)))

; Descripción: Modificar el dinero del jugador
; Dom: jugador (jugador) X dinero (int)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-set-dinero
  (lambda (jugador dinero)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          dinero
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))

; Descripción: Modificar la posición del jugador
; Dom: jugador (jugador) X posicion (int)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-set-posicion
  (lambda (jugador posicion)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          posicion
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))

; Descripción: Modificar si el jugador está en la cárcel
; Dom: jugador (jugador) X estaEnCarcel (boolean)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-set-esta-en-carcel
  (lambda (jugador estaEnCarcel)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          estaEnCarcel
          (jugador-get-cartas-salir-carcel jugador))))

; Descripción: Modificar el número de cartas para salir de la cárcel
; Dom: jugador (jugador) X cartasSalirCarcel (int)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-set-cartas-salir-carcel
  (lambda (jugador cartasSalirCarcel)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          cartasSalirCarcel)))

; Descripción: Agregar una propiedad (ID) al jugador
; Dom: jugador (jugador) X id-propiedad (int)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-agregar-propiedad
  (lambda (jugador id-propiedad)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (append (jugador-get-propiedades jugador) (list id-propiedad))
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))

; Descripción: Quitar una propiedad (ID) del jugador
; Dom: jugador (jugador) X id-propiedad (int)
; Rec: jugador
; Tipo recursión: Natural
(define jugador-quitar-propiedad
  (lambda (jugador id-propiedad)
    (define filtro-props
      (lambda (props id)
        (if (null? props)
            '()
            (let ([primer-id (first props)])
              (if (= primer-id id)
                  (filtro-props (rest props) id)
                  (cons primer-id (filtro-props (rest props) id)))))))
    
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (filtro-props (jugador-get-propiedades jugador) id-propiedad)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))
		  
; Descripción: Mover al jugador en el tablero según el valor de los dados
; Dom: jugador (jugador) X valoresDados (par) X juego (juego)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-mover
  (lambda (jugador valoresDados juego)
    (define posicion-actual (jugador-get-posicion jugador))
    (define suma-dados (+ (first valoresDados) (second valoresDados)))
    (define nueva-posicion (remainder (+ posicion-actual suma-dados) 40))
    (define pasa-por-salida 
      (and (> (+ posicion-actual suma-dados) 39) (not (= posicion-actual 0))))
    (define jugador-actualizado 
      (if pasa-por-salida
          (jugador-set-dinero jugador (+ (jugador-get-dinero jugador) 200))
          jugador))
    (jugador-set-posicion jugador-actualizado nueva-posicion)))

; Descripción: Permitir a un jugador comprar una propiedad
; Dom: jugador (jugador) X propiedad (propiedad)
; Rec: jugador
; Tipo recursión: No aplica
(define jugador-comprar-propiedad
  (lambda (jugador propiedad)
    (define precio (propiedad-get-precio propiedad))
    (define dinero-actual (jugador-get-dinero jugador))
    
    (if (>= dinero-actual precio)
        (let ([jugador-con-menos-dinero (jugador-set-dinero jugador (- dinero-actual precio))])
          (jugador-agregar-propiedad jugador-con-menos-dinero (propiedad-get-id propiedad)))
        jugador)))

; Descripción: Permitir a un jugador pagar renta a otro jugador
; Dom: jugador-pagador (jugador) X jugador-receptor (jugador) X monto (int)
; Rec: Lista jugadores actualizados (lista con dos jugadores: [pagador, receptor])
; Tipo recursión: No aplica
(define jugador-pagar-renta
  (lambda (jugador-pagador jugador-receptor monto)
    (define dinero-pagador (jugador-get-dinero jugador-pagador))
    (define dinero-receptor (jugador-get-dinero jugador-receptor))
    
    (if (>= dinero-pagador monto)
        (let ([nuevo-dinero-pagador (- dinero-pagador monto)]
              [nuevo-dinero-receptor (+ dinero-receptor monto)])
          (list (jugador-set-dinero jugador-pagador nuevo-dinero-pagador)
                (jugador-set-dinero jugador-receptor nuevo-dinero-receptor)))
        (let ([monto-parcial dinero-pagador])
          (list (jugador-set-dinero jugador-pagador 0)
                (jugador-set-dinero jugador-receptor (+ dinero-receptor monto-parcial)))))))

; Descripción: Verificar si un jugador está en bancarrota (sin dinero)
; Dom: jugador (jugador) X deuda (int, opcional)
; Rec: boolean (#t si está en bancarrota, #f si no)
; Tipo recursión: Natural
(define jugador-esta-en-bancarrota
  (lambda (jugador . deuda-opcional)
    (define deuda 
      (if (null? deuda-opcional)
          0  
          (car deuda-opcional)))
    
    (< (jugador-get-dinero jugador) deuda)))