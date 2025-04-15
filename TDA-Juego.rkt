#lang racket


(provide juego
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
         juego-lanzar-dados)



(define juego
  (lambda (jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)
    (list jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)))


(define juego?
  (lambda (elemento)
    (if (list? elemento)
        (if (= (length elemento) 9)
            (and (list? (first elemento))
                 (or (vector? (second elemento)) (list? (second elemento)))
                 (number? (third elemento))
                 (number? (fourth elemento))
                 (number? (fifth elemento))
                 (number? (sixth elemento))
                 (number? (seventh elemento))
                 (number? (eighth elemento))
                 (string? (ninth elemento)))
            #f)
        #f)))


(define juego-get-jugadores first)


(define juego-get-tablero second)


(define juego-get-dinero-banco third)


(define juego-get-numero-dados fourth)


(define juego-get-turno-actual fifth)


(define juego-get-tasa-impuesto sixth)


(define juego-get-maximo-casas seventh)

(define juego-get-maximo-hoteles eighth)


(define juego-get-estado-juego ninth)


(define juego-set-jugadores
  (lambda (juego jugadores)
    (list jugadores
          (juego-get-tablero juego)
          (juego-get-dinero-banco juego)
          (juego-get-numero-dados juego)
          (juego-get-turno-actual juego)
          (juego-get-tasa-impuesto juego)
          (juego-get-maximo-casas juego)
          (juego-get-maximo-hoteles juego)
          (juego-get-estado-juego juego))))


(define juego-set-tablero
  (lambda (juego tablero)
    (list (juego-get-jugadores juego)
          tablero
          (juego-get-dinero-banco juego)
          (juego-get-numero-dados juego)
          (juego-get-turno-actual juego)
          (juego-get-tasa-impuesto juego)
          (juego-get-maximo-casas juego)
          (juego-get-maximo-hoteles juego)
          (juego-get-estado-juego juego))))


(define juego-set-dinero-banco
  (lambda (juego dineroBanco)
    (list (juego-get-jugadores juego)
          (juego-get-tablero juego)
          dineroBanco
          (juego-get-numero-dados juego)
          (juego-get-turno-actual juego)
          (juego-get-tasa-impuesto juego)
          (juego-get-maximo-casas juego)
          (juego-get-maximo-hoteles juego)
          (juego-get-estado-juego juego))))


(define juego-set-turno-actual
  (lambda (juego turnoActual)
    (list (juego-get-jugadores juego)
          (juego-get-tablero juego)
          (juego-get-dinero-banco juego)
          (juego-get-numero-dados juego)
          turnoActual
          (juego-get-tasa-impuesto juego)
          (juego-get-maximo-casas juego)
          (juego-get-maximo-hoteles juego)
          (juego-get-estado-juego juego))))


(define juego-set-estado-juego
  (lambda (juego estadoJuego)
    (list (juego-get-jugadores juego)
          (juego-get-tablero juego)
          (juego-get-dinero-banco juego)
          (juego-get-numero-dados juego)
          (juego-get-turno-actual juego)
          (juego-get-tasa-impuesto juego)
          (juego-get-maximo-casas juego)
          (juego-get-maximo-hoteles juego)
          estadoJuego)))


(define juego-agregar-jugador
  (lambda (juego jugador)
    ; Define una función auxiliar para ajustar el dinero del jugador
    (define jugador-con-dinero-inicial
      (lambda (j)
        (if (= (third j) 1500)
            j
            (list (first j) (second j) 1500 (fourth j) (fifth j) (sixth j) (seventh j)))))
    
    ; Agrega el jugador a la lista de jugadores del juego
    (juego-set-jugadores 
     juego 
     (append (juego-get-jugadores juego) 
             (list (jugador-con-dinero-inicial jugador))))))


(define juego-obtener-jugador-actual
  (lambda (juego)
    (let ([jugadores (juego-get-jugadores juego)]
          [turno (juego-get-turno-actual juego)])
      (if (< turno (length jugadores))
          (list-ref jugadores turno)
          null))))  


(define juego-lanzar-dados
  (lambda ()
    (let ([dado1 (+ 1 (random 6))]
          [dado2 (+ 1 (random 6))])
      (display "Resultado del primer dado: ")
      (displayln dado1)
      (display "Resultado del segundo dado: ")
      (displayln dado2)
      (list dado1 dado2))))