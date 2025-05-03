#lang racket

(require "main_214716100_mario_nova.rkt")


(define j1 (jugador 0 "Pedro" 1500 '() 0 #f 0))
(define j2 (jugador 1 "María" 1500 '() 0 #f 0))

(define prop1  (propiedad  1 "Avenida Central"        600 20 #f 0 #f #f))
(define prop2  (propiedad  2 "Calle Principal"        650 22 #f 0 #f #f))
(define prop3  (propiedad  3 "Paseo del Mar"          700 25 #f 0 #f #f))
(define prop4  (propiedad  4 "Boulevard Norte"        750 30 #f 0 #f #f))
(define prop5  (propiedad  5 "Avenida del Sol"        800 32 #f 0 #f #f))
(define prop6  (propiedad  6 "Calle del Bosque"        850 35 #f 0 #f #f))
(define prop7  (propiedad  7 "Paseo Montaña"          900 38 #f 0 #f #f))
(define prop8  (propiedad  8 "Plaza Mayor"            950 40 #f 0 #f #f))
(define prop9  (propiedad  9 "Gran Vía"              1000 45 #f 0 #f #f))
(define prop10 (propiedad 10 "Avenida Comercial"     1050 48 #f 0 #f #f))
(define prop11 (propiedad 11 "Calle Industrial"      1100 50 #f 0 #f #f))
(define prop12 (propiedad 12 "Paseo Financiero"      1150 55 #f 0 #f #f))
(define prop13 (propiedad 13 "Avenida Tecnológica"   1200 60 #f 0 #f #f))
(define prop14 (propiedad 14 "Calle Universitaria"   1250 65 #f 0 #f #f))
(define prop15 (propiedad 15 "Plaza de la Fortuna"   1300 70 #f 0 #f #f))

(define suerte1  (carta  1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define suerte2  (carta  2 "suerte" "Vaya a la cárcel"                  'ir-a-carcel))
(define suerte3  (carta  3 "suerte" "El banco le paga $50"             'banco-paga))
(define suerte4  (carta  4 "suerte" "Avance 3 casillas"                'avanzar-tres))
(define suerte5  (carta  5 "suerte" "Retroceda 2 casillas"             'retroceder-dos))
(define suerte6  (carta  6 "suerte" "Pague $100 al banco"               'pagar-banco))
(define suerte7  (carta  7 "suerte" "Es su día de suerte, reciba $200"  'recibir-doscientos))
(define suerte8  (carta  8 "suerte" "Ha ganado un premio de $25"        'premio-menor))
(define suerte9  (carta  9 "suerte" "Pague $50 a cada jugador"          'pagar-jugadores))
(define suerte10 (carta 10 "suerte" "Cobre $10 de cada jugador"        'cobrar-diez))

(define comunidad1  (carta 11 "comunidad" "Pague impuestos por $100"          'pagar-impuesto))
(define comunidad2  (carta 12 "comunidad" "Es su cumpleaños, reciba $10"     'cumpleanos))
(define comunidad3  (carta 13 "comunidad" "Salga de la cárcel gratis"         'salir-carcel))
(define comunidad4  (carta 14 "comunidad" "Error bancario a su favor, reciba $200" 'error-bancario))
(define comunidad5  (carta 15 "comunidad" "Pague impuestos sobre propiedades $150" 'impuestos-propiedades))
(define comunidad6  (carta 16 "comunidad" "Ha ganado el segundo premio, reciba $10" 'segundo-premio))
(define comunidad7  (carta 17 "comunidad" "Vaya a la casilla de salida"        'ir-a-salida))
(define comunidad8  (carta 18 "comunidad" "Reciba $100 por servicios prestados" 'servicios-prestados))
(define comunidad9  (carta 19 "comunidad" "Pague $50 por consulta médica"       'consulta-medica))
(define comunidad10 (carta 20 "comunidad" "Reciba $25 por dividendos"         'dividendos))


(define tablero-vacio
  (tablero
    '()  
    (list suerte1  suerte2  suerte3  suerte4  suerte5
          suerte6  suerte7  suerte8  suerte9  suerte10)
    (list comunidad1 comunidad2 comunidad3 comunidad4 comunidad5
          comunidad6 comunidad7 comunidad8 comunidad9 comunidad10)
    (list (cons 'salida      0)
          (cons 'carcel      10)
          (cons 'suerte      7)
          (cons 'suerte      22)
          (cons 'suerte      36)
          (cons 'comunidad   2)
          (cons 'comunidad  17)
          (cons 'comunidad  33))))

(define lista-propiedades
  (list (cons prop1  1)  (cons prop2  3)  (cons prop3  5)
        (cons prop4  6)  (cons prop5  8)  (cons prop6  9)
        (cons prop7 11)  (cons prop8 12)  (cons prop9 14)
        (cons prop10 15) (cons prop11 18) (cons prop12 19)
        (cons prop13 21) (cons prop14 24) (cons prop15 25)))

(define tablero-completo
  (tablero-agregar-propiedad tablero-vacio lista-propiedades))

(define g0 (juego '() tablero-completo 20000 2 0 10 4 1 "en-curso"))


(define g1 (juego-agregar-jugador g0 j1))
(define g2 (juego-agregar-jugador g1 j2))


(display "===== CAPITALIA (Simulación 1 - 2 Jugadores) =====\n\n")

(display "TURNO 1: Pedro\n")
(define g3
  (juego-jugar-turno
    g2
    (juego-lanzar-dados 1 5) 
    #t #f #f #f))
g3

(display "\nTURNO 2: María\n")
(define g4
  (juego-jugar-turno
    g3
    (juego-lanzar-dados 1 1) 
    #t #f #f #f))
g4

(display "\nTURNO 3: Pedro\n")
(define g5
  (juego-jugar-turno
    g4
    (juego-lanzar-dados 3 4)
    #t #f #f #f))
g5


(display "\nTURNO 4: María\n")
(define g6
  (juego-jugar-turno
    g5
    (juego-lanzar-dados 4 5)
    #t #f #f #f))
g6

(display "\nTURNO 5: Pedro\n")
(define g7
  (juego-jugar-turno
    g6
    (juego-lanzar-dados 5 1)
    #t #f #f #f))
g7

(display "\nTURNO 6: María\n")
(define g8
  (juego-jugar-turno
    g7
    (juego-lanzar-dados 1 2)  
    #t #f #f #f))
g8

(display "\n===== ESTADO FINAL DEL JUEGO =====\n")
(for ([idx (in-range 2)])
  (define pj (list-ref (juego-get-jugadores g8) idx))
  (display (format "Jugador ~a:\n" (jugador-get-nombre pj)))
  (display (format "  - Dinero: ~a\n" (jugador-get-dinero pj)))
  (display (format "  - Propiedades: ~a\n" (jugador-get-propiedades pj)))
  (display (format "  - Posición: ~a\n\n" (jugador-get-posicion pj))))
  
(display "Verificando bancarrota de Pedro: ")
(display (jugador-esta-en-bancarrota (list-ref (juego-get-jugadores g8) 0)))
(display "\nVerificando bancarrota de María: ")
(display (jugador-esta-en-bancarrota (list-ref (juego-get-jugadores g8) 1)))
(display "\n")
