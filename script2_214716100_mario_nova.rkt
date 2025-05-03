#lang racket


(require "main_214716100_mario_nova.rkt")


(define j1 (jugador 0 "Roberto" 1500 '() 0 #f 0))
(define j2 (jugador 1 "Laura"    1500 '() 0 #f 0))
(define j3 (jugador 2 "Carlos"   1500 '() 0 #f 0))


(define prop1  (propiedad  1 "Plaza Central"             500 18 #f 0 #f #f))
(define prop2  (propiedad  2 "Avenida Libertad"          550 20 #f 0 #f #f))
(define prop3  (propiedad  3 "Calle Victoria"            600 22 #f 0 #f #f))
(define prop4  (propiedad  4 "Paseo de la Playa"         650 25 #f 0 #f #f))
(define prop5  (propiedad  5 "Boulevard Principal"       700 28 #f 0 #f #f))
(define prop6  (propiedad  6 "Avenida de los Pinos"      750 30 #f 0 #f #f))
(define prop7  (propiedad  7 "Calle del Arte"            800 32 #f 0 #f #f))
(define prop8  (propiedad  8 "Plaza de la Música"        850 35 #f 0 #f #f))
(define prop9  (propiedad  9 "Avenida de la Ciencia"     900 38 #f 0 #f #f))
(define prop10 (propiedad 10 "Calle de la Innovación"    950 40 #f 0 #f #f))
(define prop11 (propiedad 11 "Paseo Financiero"         1000 45 #f 0 #f #f))
(define prop12 (propiedad 12 "Boulevard Tecnológico"    1050 48 #f 0 #f #f))
(define prop13 (propiedad 13 "Avenida del Progreso"     1100 50 #f 0 #f #f))
(define prop14 (propiedad 14 "Plaza del Futuro"         1150 55 #f 0 #f #f))
(define prop15 (propiedad 15 "Calle del Éxito"         1200 60 #f 0 #f #f))


(define suerte1  (carta  1 "suerte" "Avance hasta la casilla de salida"              'ir-a-salida))
(define suerte2  (carta  2 "suerte" "Vaya a la cárcel"                                   'ir-a-carcel))
(define suerte3  (carta  3 "suerte" "El banco le paga $50"                           'banco-paga))
(define suerte4  (carta  4 "suerte" "Avance a la propiedad más cercana"          'avanzar-propiedad))
(define suerte5  (carta  5 "suerte" "Retroceda 3 casillas"                        'retroceder-tres))
(define suerte6  (carta  6 "suerte" "Pague $75 al banco"                       'pagar-banco-setentaycinco))
(define suerte7  (carta  7 "suerte" "Es su día de suerte, reciba $150"          'recibir-cientocincuenta))
(define suerte8  (carta  8 "suerte" "Ha ganado un premio de $30"                'premio-treinta))
(define suerte9  (carta  9 "suerte" "Pague $40 a cada jugador"                'pagar-jugadores-cuarenta))
(define suerte10 (carta 10 "suerte" "Cobre $15 de cada jugador"               'cobrar-quince))


(define comunidad1  (carta 11 "comunidad" "Pague impuestos por $100"                   'pagar-impuesto))
(define comunidad2  (carta 12 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define comunidad3  (carta 13 "comunidad" "Salga de la cárcel gratis"                   'salir-carcel))
(define comunidad4  (carta 14 "comunidad" "Error bancario a su favor, reciba $100"     'error-bancario-cien))
(define comunidad5  (carta 15 "comunidad" "Pague impuestos sobre propiedades $120"      'impuestos-propiedades-cientoveinte))
(define comunidad6  (carta 16 "comunidad" "Ha ganado el segundo premio, reciba $15"    'segundo-premio-quince))
(define comunidad7  (carta 17 "comunidad" "Vaya a la casilla de salida"                 'ir-a-salida))
(define comunidad8  (carta 18 "comunidad" "Reciba $80 por servicios prestados"         'servicios-prestados-ochenta))
(define comunidad9  (carta 19 "comunidad" "Pague $60 por consulta médica"              'consulta-medica-sesenta))
(define comunidad10 (carta 20 "comunidad" "Reciba $35 por dividendos"                'dividendos-treintaycinco))


(define tablero-vacio
  (tablero
    '() 
    (list suerte1  suerte2  suerte3  suerte4  suerte5
          suerte6  suerte7  suerte8  suerte9  suerte10)
    (list comunidad1 comunidad2 comunidad3 comunidad4 comunidad5
          comunidad6 comunidad7 comunidad8 comunidad9 comunidad10)
    (list (cons 'salida     0)
          (cons 'carcel     8)
          (cons 'suerte     3)
          (cons 'suerte    12)
          (cons 'suerte    24)
          (cons 'comunidad  6)
          (cons 'comunidad 18)
          (cons 'comunidad 30))))


(define lista-propiedades
  (list (cons prop1   1)  (cons prop2   2)  (cons prop3   4)
        (cons prop4   5)  (cons prop5   7)  (cons prop6   9)
        (cons prop7  10)  (cons prop8  11)  (cons prop9  13)
        (cons prop10 14)  (cons prop11 15)  (cons prop12 16)
        (cons prop13 17)  (cons prop14 19)  (cons prop15 21)))


(define tablero-completo
  (tablero-agregar-propiedad tablero-vacio lista-propiedades))

(define g0 (juego '() tablero-completo 30000 2 0 10 4 1 "en-curso"))


(define g1 (juego-agregar-jugador g0 j1))
(define g2 (juego-agregar-jugador g1 j2))
(define g3 (juego-agregar-jugador g2 j3))


(display "===== CAPITALIA (Simulación 2 - 3 Jugadores) =====\n\n")


(display "TURNO 1: Roberto\n")
(define g4
  (juego-jugar-turno
    g3
    (juego-lanzar-dados 1 3) 
    #t #f #f #f))
g4


(display "\nTURNO 2: Laura\n")
(define g5
  (juego-jugar-turno
    g4
    (juego-lanzar-dados 2 4)
    #t #f #f #f))
g5


(display "\nTURNO 3: Carlos\n")
(define g6
  (juego-jugar-turno
    g5
    (juego-lanzar-dados 3 5) 
    #t #f #f #f))
g6


(display "\nTURNO 4: Roberto\n")
(define g7
  (juego-jugar-turno
    g6
    (juego-lanzar-dados 4 1)
    #t #f #f #f))
g7


(display "\nTURNO 5: Laura\n")
(define g8
  (juego-jugar-turno
    g7
    (juego-lanzar-dados 5 2)
    #f #f #t #f))
g8


(display "\nTURNO 6: Carlos\n")
(define g9
  (juego-jugar-turno
    g8
    (juego-lanzar-dados 1 4) 
    #t #f #f #t))
g9


(display "\nTURNO 7: Roberto\n")
(define g10
  (juego-jugar-turno
    g9
    (juego-lanzar-dados 2 3) 
    #t #t #f #f))
g10


(display "\nTURNO 8: Laura\n")
(define g11
  (juego-jugar-turno
    g10
    (juego-lanzar-dados 3 2) 
    #t #f #f #f))
g11


(display "\nTURNO 9: Carlos\n")
(define g12
  (juego-jugar-turno
    g11
    (juego-lanzar-dados 4 3)
    #t #f #f #f))
g12


(display "\nTURNO 10: Roberto\n")
(define g13
  (juego-jugar-turno
    g12
    (juego-lanzar-dados 5 4)
    #t #f #f #f))
g13


(display "\nTURNO 11: Laura\n")
(define g14
  (juego-jugar-turno
    g13
    (juego-lanzar-dados 1 5)
    #t #f #f #f))
g14


(display "\nTURNO 12: Carlos\n")
(define g15
  (juego-jugar-turno
    g14
    (juego-lanzar-dados 2 1)
    #t #t #f #f))
g15


(display "\n===== ESTADO FINAL DEL JUEGO =====\n")
(for ([idx (in-range 3)])
  (define pj (list-ref (juego-get-jugadores g15) idx))
  (display (format "Jugador ~a:\n" (jugador-get-nombre pj)))
  (display (format "  - Dinero: ~a\n"   (jugador-get-dinero   pj)))
  (display (format "  - Propiedades: ~a\n" (jugador-get-propiedades pj)))
  (display (format "  - Posición: ~a\n\n"  (jugador-get-posicion pj))))

(display "Verificando bancarrota de Roberto: ")
(display (jugador-esta-en-bancarrota (list-ref (juego-get-jugadores g15) 0)))
(display "\nVerificando bancarrota de Laura:   ")
(display (jugador-esta-en-bancarrota (list-ref (juego-get-jugadores g15) 1)))
(display "\nVerificando bancarrota de Carlos:  ")
(display (jugador-esta-en-bancarrota (list-ref (juego-get-jugadores g15) 2)))
(display "\n")
