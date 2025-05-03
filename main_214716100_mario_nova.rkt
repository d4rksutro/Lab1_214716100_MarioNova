#lang racket


(require "TDA-Carta.rkt"
         "TDA-Juego.rkt"
         "TDA-Jugador.rkt"
         "TDA-Propiedad.rkt"
         "TDA-Tablero.rkt")

(provide 
 ; TDA Carta
 carta
 carta?
 carta-get-id
 carta-get-tipo
 carta-get-descripcion
 carta-get-accion
 
 ; TDA Jugador
 jugador
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
 jugador-calcular-renta
 jugador-esta-en-bancarrota
 
 ; TDA Propiedad
 propiedad
 propiedad?
 propiedad-get-id
 propiedad-get-nombre
 propiedad-get-precio
 propiedad-get-renta
 propiedad-get-dueno
 propiedad-get-casas
 propiedad-get-es-hotel
 propiedad-get-esta-hipotecada
 propiedad-set-dueno
 propiedad-set-casas
 propiedad-set-es-hotel
 propiedad-set-esta-hipotecada
 propiedad-calcular-renta
 propiedad-hipotecar
 propiedad-construir-casa
 propiedad-construir-hotel
 
 ; TDA Tablero
 tablero
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
 tablero-agregar-propiedad
 
 ; TDA Juego
 juego
 juego?
 juego-get-jugadores
 juego-get-tablero
 juego-get-dinero-banco
 juego-get-numero-dados
 juego-get-turno-actual
 juego-get-tasa-impuesto
 juego-get-maximo-casas
 juego-get-maximo-hoteles
 juego-get-estado-juego
 juego-set-jugadores
 juego-set-tablero
 juego-set-dinero-banco
 juego-set-turno-actual
 juego-set-estado-juego
 juego-agregar-jugador
 juego-obtener-jugador-actual
 juego-lanzar-dados
 juego-extraer-carta
 juego-jugar-turno
 pasar-turno)

; Función para ir a la casilla de salida
(define ir-a-salida
  (lambda (jugador juego)
    (jugador-set-posicion jugador 0)))

; Función para ir a la cárcel
(define ir-a-carcel
  (lambda (jugador juego)
    (define casillas-especiales (tablero-get-casillas-especiales (juego-get-tablero juego)))
    (define posiciones-carcel
      (filter (lambda (casilla) (equal? (car casilla) 'carcel)) casillas-especiales))
    
    (if (null? posiciones-carcel)
        jugador ; 
        (let* ([pos-carcel (cdar posiciones-carcel)]
               [jugador-movido (jugador-set-posicion jugador pos-carcel)])
          (jugador-set-esta-en-carcel jugador-movido #t)))))

; Función para que el banco pague al jugador
(define banco-paga
  (lambda (jugador juego)
    (jugador-set-dinero jugador (+ (jugador-get-dinero jugador) 50))))

; Función para que el jugador pague impuestos
(define pagar-impuesto
  (lambda (jugador juego)
    (jugador-set-dinero jugador (- (jugador-get-dinero jugador) 100))))

; Función para el cumpleaños (recibe 10 de cada jugador)
(define cumpleanos
  (lambda (jugador juego)
    (define jugadores (juego-get-jugadores juego))
    (define id-jugador (jugador-get-id jugador))
    (define jugador-actualizado
      (let* ([cantidad-jugadores (length jugadores)]
             [cantidad-recibir (* 10 (- cantidad-jugadores 1))])
        (jugador-set-dinero jugador (+ (jugador-get-dinero jugador) cantidad-recibir))))
    jugador-actualizado))

; Función para obtener una carta de salir de la cárcel
(define salir-carcel
  (lambda (jugador juego)
    (jugador-set-cartas-salir-carcel 
     jugador 
     (+ (jugador-get-cartas-salir-carcel jugador) 1))))

; Función auxiliar para lanzar dados (wrapper para usar en el script)
(define lanzar-dados juego-lanzar-dados)

; Función auxiliar para obtener un jugador específico del juego
(define get-jugador
  (lambda (juego)
    (juego-obtener-jugador-actual juego)))