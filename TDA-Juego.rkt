#lang racket

(require "TDA-Jugador.rkt"
         "TDA-Tablero.rkt"
         "TDA-Propiedad.rkt"
         "TDA-Carta.rkt"
         net/url
         json)

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
         juego-lanzar-dados
         juego-extraer-carta
         juego-jugar-turno
         pasar-turno)

; Descripción: Construir el TDA Juego
; Dom: jugadores (lista) X tablero (tablero) X dineroBanco (int) X numeroDados (int) X turnoActual (int) X tasaImpuesto (int) X maximoCasas (int) X maximoHoteles (int) X estadoJuego (string)
; Rec: juego
; Tipo recursión: No aplica
(define juego
  (lambda (jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)
    (list jugadores tablero dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)))

; Descripción: Verificar si un elemento es un juego válido
; Dom: elemento (any)
; Rec: boolean
; Tipo recursión: No aplica
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

; Descripción: Obtener los jugadores del juego
; Dom: juego (juego)
; Rec: lista de jugadores
; Tipo recursión: No aplica
(define juego-get-jugadores first)

; Descripción: Obtener el tablero del juego
; Dom: juego (juego)
; Rec: tablero
; Tipo recursión: No aplica
(define juego-get-tablero second)

; Descripción: Obtener el dinero del banco
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-dinero-banco third)

; Descripción: Obtener el número de dados
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-numero-dados fourth)

; Descripción: Obtener el turno actual
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-turno-actual fifth)

; Descripción: Obtener la tasa de impuesto
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-tasa-impuesto sixth)

; Descripción: Obtener el máximo de casas
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-maximo-casas seventh)

; Descripción: Obtener el máximo de hoteles
; Dom: juego (juego)
; Rec: int
; Tipo recursión: No aplica
(define juego-get-maximo-hoteles eighth)

; Descripción: Obtener el estado del juego
; Dom: juego (juego)
; Rec: string
; Tipo recursión: No aplica
(define juego-get-estado-juego ninth)

; Descripción: Modificar los jugadores del juego
; Dom: juego (juego) X jugadores (lista de jugadores)
; Rec: juego
; Tipo recursión: No aplica
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

; Descripción: Modificar el tablero del juego
; Dom: juego (juego) X tablero (tablero)
; Rec: juego
; Tipo recursión: No aplica
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

; Descripción: Modificar el dinero del banco
; Dom: juego (juego) X dineroBanco (int)
; Rec: juego
; Tipo recursión: No aplica
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

; Descripción: Modificar el turno actual
; Dom: juego (juego) X turnoActual (int)
; Rec: juego
; Tipo recursión: No aplica
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

; Descripción: Modificar el estado del juego
; Dom: juego (juego) X estadoJuego (string)
; Rec: juego
; Tipo recursión: No aplica
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

; Descripción: Agregar un jugador a la partida
; Dom: juego (juego) X jugador (jugador)
; Rec: juego
; Tipo recursión: No aplica
(define juego-agregar-jugador
  (lambda (juego jugador)
    (define jugador-con-dinero-inicial
      (lambda (j)
        (if (= (jugador-get-dinero j) 1500)
            j
            (jugador-set-dinero j 1500))))
    
    (juego-set-jugadores 
     juego 
     (append (juego-get-jugadores juego) 
             (list (jugador-con-dinero-inicial jugador))))))

; Descripción: Obtener el jugador cuyo turno se encuentra en curso
; Dom: juego (juego)
; Rec: jugador
; Tipo recursión: No aplica
(define juego-obtener-jugador-actual
  (lambda (juego)
    (let ([jugadores (juego-get-jugadores juego)]
          [turno (juego-get-turno-actual juego)])
      (if (< turno (length jugadores))
          (list-ref jugadores turno)
          null))))  

; Descripción: Simular el lanzamiento de 2 dados
; Dom: seed (number)
; Rec: (valordado1 valordado2)
; Tipo recursión: No aplica
(define juego-lanzar-dados
  (lambda (seed)
    (define (generar-numero-dado semilla)
      (define a 1103515245)
      (define c 12345)
      (define m 2147483648)
      (define nuevo-valor (modulo (+ (* a semilla) c) m))
      (values (+ 1 (modulo nuevo-valor 6)) nuevo-valor))
    
    (define-values (dado1 semilla1) (generar-numero-dado seed))
    (define-values (dado2 _) (generar-numero-dado semilla1))
    
    (display "Resultado del primer dado: ")
    (displayln dado1)
    (display "Resultado del segundo dado: ")
    (displayln dado2)
    
    (list dado1 dado2)))

; Descripción: Procesar un turno (dados → mover → compra / renta → pasar turno)
; Dom: juego (juego)
; Rec: juego
; Tipo recursión: No aplica
(define juego-jugar-turno
  (lambda (juego)
    (if (not (string=? (juego-get-estado-juego juego) "en-curso"))
        (begin
          (displayln (format "El juego no está en curso. Estado: ~a"
                             (juego-get-estado-juego juego)))
          juego)
        (let* ([jug-actual   (juego-obtener-jugador-actual juego)]
               [tablero      (juego-get-tablero juego)]

               [_ (displayln (format "\n=== Turno de ~a ==="
                                     (jugador-get-nombre jug-actual)))]
               [_ (displayln (format "Dinero: $~a"
                                     (jugador-get-dinero jug-actual)))]
               [_ (displayln (format "Posición: ~a"
                                     (jugador-get-posicion jug-actual)))]

               [seed          (+ (jugador-get-id jug-actual)
                                 (juego-get-turno-actual juego))]
               [dados         (juego-lanzar-dados seed)]
               [jug-mov       (jugador-mover jug-actual dados juego)]
               [pos           (jugador-get-posicion jug-mov)]

               [jugs-movidos  (list-set (juego-get-jugadores juego)
                                        (jugador-get-id jug-actual)
                                        jug-mov)]
               [game-mov      (juego-set-jugadores juego jugs-movidos)]

               [prop          (tablero-get-propiedad-en-posicion tablero pos)])
          
          (let ([game-event
                 (if (and prop (not (null? prop)) (not (equal? prop '())))
                     (let ([owner (propiedad-get-dueno prop)])
                       (if (or (not owner) (null? owner) (equal? owner '()))
                           (let* ([jug-comp (jugador-comprar-propiedad jug-mov prop)]
                                  [prop*    (propiedad-set-dueno prop
                                                                 (jugador-get-id jug-comp))]
                                  [props*   (map (lambda (pp)
                                                   (if (= (propiedad-get-id (car pp))
                                                          (propiedad-get-id prop*))
                                                       (cons prop* (cdr pp))
                                                       pp))
                                                 (tablero-get-propiedades tablero))]
                                  [tab*     (tablero-set-propiedades tablero props*)]
                                  [jugs*    (list-set jugs-movidos
                                                      (jugador-get-id jug-comp)
                                                      jug-comp)])
                             (displayln (format "Compra: ~a por $~a"
                                                (propiedad-get-nombre prop*)
                                                (propiedad-get-precio  prop*)))
                             (juego-set-jugadores
                               (juego-set-tablero game-mov tab*) jugs*))

                           (if (number? owner)
                               (let* ([jug-rec   (list-ref (juego-get-jugadores game-mov)
                                                           owner)]
                                      [renta     (propiedad-calcular-renta prop)]
                                      [pagos     (jugador-pagar-renta jug-mov jug-rec renta)]
                                      [jug-paga  (first  pagos)]
                                      [jug-rec2  (second pagos)]
                                      [jugs*     (map (lambda (p)
                                                        (cond [(= (jugador-get-id p)
                                                                  (jugador-get-id jug-paga)) jug-paga]
                                                              [(= (jugador-get-id p)
                                                                  (jugador-get-id jug-rec2)) jug-rec2]
                                                              [else p]))
                                                      jugs-movidos)])
                                 (displayln (format "Renta: $~a de ~a a ~a"
                                                    renta
                                                    (jugador-get-nombre jug-paga)
                                                    (jugador-get-nombre jug-rec2)))
                                 (juego-set-jugadores game-mov jugs*))
                               game-mov)))
                     game-mov)])
            (pasar-turno game-event))))))

; Descripción: Extraer una carta aleatoria del mazo indicado
; Dom: juego (juego) X tipoMazo (string: "suerte" o "comunidad")
; Rec: (juego, carta)
; Tipo recursión: No aplica
(define juego-extraer-carta
  (lambda (juego tipoMazo)
    (define semilla (juego-get-turno-actual juego))
    
    (define mazo 
      (if (string=? tipoMazo "suerte")
          (tablero-get-cartas-suerte (juego-get-tablero juego))
          (tablero-get-cartas-comunidad (juego-get-tablero juego))))
    
    (if (null? mazo)
        (cons juego null)
        (let* ([indice (modulo semilla (length mazo))]
               [carta-extraida (list-ref mazo indice)]
               [nuevo-mazo (append (take mazo indice) 
                                  (drop mazo (+ indice 1)))]
               [nuevo-tablero (if (string=? tipoMazo "suerte")
                                  (tablero-set-cartas-suerte (juego-get-tablero juego) nuevo-mazo)
                                  (tablero-set-cartas-comunidad (juego-get-tablero juego) nuevo-mazo))]
               [nuevo-juego (juego-set-tablero juego nuevo-tablero)])
          (cons nuevo-juego carta-extraida)))))

; Descripción: Pasar el turno al siguiente jugador
; Dom: juego (juego)
; Rec: juego
; Tipo recursión: No aplica
(define pasar-turno
  (lambda (juego)
    (define turno-actual (juego-get-turno-actual juego))
    (define num-jugadores (length (juego-get-jugadores juego)))
    
    (define nuevo-turno (remainder (+ turno-actual 1) num-jugadores))
    
    (juego-set-turno-actual juego nuevo-turno)))