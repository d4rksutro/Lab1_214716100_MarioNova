#lang racket

(require "TDA-Jugador.rkt"
         "TDA-Propiedad.rkt"
         "TDA-Carta.rkt"
         "TDA-Tablero.rkt"
         "TDA-Juego.rkt")

(provide iniciar-capitalia
         mostrar-info-juego
         jugar-n-turnos
         crear-juego-prueba)

(define (iniciar-capitalia)
  (displayln "\n====================================")
  (displayln "        BIENVENIDO A CAPITALIA      ")
  (displayln "====================================\n")
  
  (define j1 (jugador 0 "Jugador 1" 1500 '() 0 #f 0))
  (define j2 (jugador 1 "Jugador 2" 1500 '() 0 #f 0))
  
  (define prop1 (propiedad 1 "Avenida Inicial" 50 3 null 0 #f #f))
  (define prop2 (propiedad 2 "Calle Principal" 70 5 null 0 #f #f))
  (define prop3 (propiedad 3 "Plaza Central" 90 6 null 0 #f #f))
  
  (define carta1 (carta 1 "suerte" "Avanza 3 casillas" 'avanzar-3))
  (define carta2 (carta 2 "suerte" "Retrocede 2 casillas" 'retroceder-2))
  (define carta3 (carta 3 "comunidad" "Paga impuestos de $50" 'pagar-50))
  
  (define tablero-vacio (tablero '() '() '() '()))
  
  (define propiedades-con-pos 
    (list (cons prop1 2) 
          (cons prop2 5) 
          (cons prop3 8)))
  
  (define tablero-con-props (tablero-agregar-propiedades tablero-vacio propiedades-con-pos))
  
  (define suerte-cards (list carta1 carta2))
  (define comunidad-cards (list carta3))
  
  (define tablero-con-cartas-suerte 
    (tablero-set-cartas-suerte tablero-con-props suerte-cards))
  
  (define tablero-con-cartas 
    (tablero-set-cartas-comunidad tablero-con-cartas-suerte comunidad-cards))
  
  (define casillas-especiales 
    (list (cons 'salida 0)
          (cons 'carcel 10)
          (cons 'suerte 7)
          (cons 'comunidad 3)))
  
  (define tablero-final 
    (tablero-set-casillas-especiales tablero-con-cartas casillas-especiales))
  
  (define juego-inicial (juego '() tablero-final 25000 2 0 10 4 1 "preparacion"))
  
  (define juego-con-j1 (juego-agregar-jugador juego-inicial j1))
  (define juego-con-jugadores (juego-agregar-jugador juego-con-j1 j2))
  

  (define juego-iniciado (juego-set-estado-juego juego-con-jugadores "en-curso"))
  
  (displayln "Juego inicializado con éxito.")
  (displayln (format "Jugadores: ~a" (length (juego-get-jugadores juego-iniciado))))
  (displayln (format "Propiedades en el tablero: ~a" (length (tablero-get-propiedades (juego-get-tablero juego-iniciado)))))
  
  juego-iniciado)

(define (mostrar-info-juego juego)
  (displayln "\n=== INFORMACIÓN DEL JUEGO ===")
  (displayln (format "Estado del juego: ~a" (juego-get-estado-juego juego)))
  (displayln (format "Turno actual: ~a" (juego-get-turno-actual juego)))
  (displayln (format "Dinero en el banco: $~a" (juego-get-dinero-banco juego)))
  
  (displayln "\nJugadores:")
  (for-each 
   (lambda (jugador)
     (displayln (format "- ~a: $~a, Posición: ~a, En cárcel: ~a, Propiedades: ~a" 
                        (jugador-get-nombre jugador)
                        (jugador-get-dinero jugador)
                        (jugador-get-posicion jugador)
                        (if (jugador-get-esta-en-carcel jugador) "Sí" "No")
                        (length (jugador-get-propiedades jugador)))))
   (juego-get-jugadores juego)))

(define (pasar-turno juego)
  (define turno-actual (juego-get-turno-actual juego))
  (define num-jugadores (length (juego-get-jugadores juego)))
  
  (define nuevo-turno (remainder (+ turno-actual 1) num-jugadores))
  
  (juego-set-turno-actual juego nuevo-turno))

(define (jugar-n-turnos juego n)
  (displayln (format "Jugando ~a turnos..." n))
  (if (<= n 0)
      juego
      (let ([nuevo-juego (pasar-turno juego)])
        (jugar-n-turnos nuevo-juego (- n 1)))))

(define (crear-juego-prueba num-jugadores dinero-inicial)
  (define tablero-basico (tablero '() '() '() '()))
  
  (define crear-jugadores
    (lambda (n acc)
      (if (= n 0)
          acc
          (crear-jugadores (- n 1) 
                          (cons (jugador (- n 1) 
                                         (format "Jugador ~a" n) 
                                         dinero-inicial '() 0 #f 0) 
                                acc)))))
  
  (define lista-jugadores (crear-jugadores num-jugadores '()))
  
  (define juego-base (juego '() tablero-basico 50000 2 0 10 4 1 "preparacion"))
  
  (define agregar-jugadores
    (lambda (j lista-j)
      (if (null? lista-j)
          j
          (agregar-jugadores (juego-agregar-jugador j (car lista-j)) 
                            (cdr lista-j)))))
  
  (define juego-con-jugadores (agregar-jugadores juego-base lista-jugadores))
  
  (juego-set-estado-juego juego-con-jugadores "en-curso"))

(module+ main
  (define juego-actual (iniciar-capitalia))
  (mostrar-info-juego juego-actual)
  (define juego-despues-de-turnos (jugar-n-turnos juego-actual 3))
  (mostrar-info-juego juego-despues-de-turnos))