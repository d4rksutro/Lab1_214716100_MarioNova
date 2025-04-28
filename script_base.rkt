#lang racket

; Script de Ejecución para CAPITALIA
; Este script muestra cómo utilizar las funciones implementadas para jugar una partida

; 1. Importar los módulos necesarios
(require "TDA-Jugador.rkt")
(require "TDA-Propiedad.rkt")
(require "TDA-Carta.rkt")
(require "TDA-Tablero.rkt")
(require "TDA-Juego.rkt")

;; Primera parte: Creación y configuración del tablero
; 1. Creación de jugadores
(define p1 (jugador 0 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 1 "Ana" 1500 '() 0 #f 0))
(define p3 (jugador 2 "Luis" 1500 '() 0 #f 0))

; 2. Creación de propiedades para el juego
(define prop1 (propiedad 1 "Paseo Mediterráneo" 60 2 null 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 60 4 null 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 null 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 null 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 null 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 140 10 null 0 #f #f))

; 3. Creación de cartas de suerte y arca comunal
(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'go-to-start))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'go-to-jail))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'bank-pays))
(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pay-tax))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'birthday))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'get-out-of-jail))

; 4. Creación del tablero inicial
(define empty-board (tablero '() '() '() '()))

; 5. Agregar propiedades al tablero (una a una como pide el enunciado actualizado)
(define board1 (tablero-agregar-propiedad empty-board (cons prop1 1)))
(define board2 (tablero-agregar-propiedad board1 (cons prop2 3)))
(define board3 (tablero-agregar-propiedad board2 (cons prop3 6)))
(define board4 (tablero-agregar-propiedad board3 (cons prop4 8)))
(define board5 (tablero-agregar-propiedad board4 (cons prop5 9)))
(define board6 (tablero-agregar-propiedad board5 (cons prop6 11)))

; Añadimos cartas al tablero
(define board-with-chance (tablero-set-cartas-suerte board6 (list chance1 chance2 chance3)))
(define board-complete (tablero-set-cartas-comunidad board-with-chance (list community1 community2 community3)))

; Añadimos casillas especiales
(define board-final 
  (tablero-set-casillas-especiales 
   board-complete
   (list (cons 'salida 0)
         (cons 'carcel 10)
         (cons 'suerte 7)
         (cons 'comunidad 3)
         (cons 'impuestos 4))))

; 6. Creación de un nuevo juego
(define g0 (juego '() board-final 20000 2 0 10 4 1 "preparation"))

; 7. Agregar jugadores al juego
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))
(define g3 (juego-agregar-jugador g2 p3))

; 8. Iniciar la partida
;; 9. DEMO DE 3 TURNOS USANDO juego-jugar-turno  

;; 9.1) Poner el juego en “en-curso”
(define g3-started
  (juego-set-estado-juego g3 "en-curso"))

;; 9.2) TURNO 1: Carlos
(display "\n=== TURNO 1 (Carlos) ===\n")
(define g4 (juego-jugar-turno g3-started))

;; 9.3) TURNO 2: Ana
(display "\n=== TURNO 2 (Ana) ===\n")
(define g5 (juego-jugar-turno g4))

;; 9.4) TURNO 3: Luis
(display "\n=== TURNO 3 (Luis) ===\n")
(define g6 (juego-jugar-turno g5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. RESUMEN FINAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display "\n=== RESUMEN DEL ESTADO DEL JUEGO ===\n")
(for-each
 (λ (pl)
   (display (format "~a: $~a, Posición: ~a, Propiedades: ~a\n"
                   (jugador-get-nombre   pl)
                   (jugador-get-dinero   pl)
                   (jugador-get-posicion pl)
                   (length (jugador-get-propiedades pl)))))
 (juego-get-jugadores g6))

(display "\nFin de la demostración de 3 turnos\n")
