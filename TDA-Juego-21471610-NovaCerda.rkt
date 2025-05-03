#lang racket

(require "TDA-Jugador.rkt"
         "TDA-Tablero.rkt"
         "TDA-Propiedad.rkt"
         "TDA-Carta.rkt")

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
; Dom: seed-dado1 (number) X seed-dado2 (number)
; Rec: (valordado1 valordado2)
; Tipo recursión: No aplica
(define juego-lanzar-dados
  (lambda (seed-dado1 seed-dado2)
    (define (getDadoRandom seed)
      (cond
        [(= seed 1) 1]
        [(= seed 2) 2]
        [(= seed 5) 3]
        [(= seed 0) 4]
        [(= seed 3) 5]
        [(= seed 4) 6]
        [else (+ 1 (modulo seed 6))])) 
    (define dado1 (getDadoRandom seed-dado1))
    (define dado2 (getDadoRandom seed-dado2))
        (display "Resultado del primer dado: ")
    (displayln dado1)
    (display "Resultado del segundo dado: ")
    (displayln dado2)

    (list dado1 dado2)))

; Descripción: Procesa un turno (dados → mover → compra / renta → pasar turno)
; Dom: juego (juego) X valoresDados (pair/lista) X comprarPropiedad_or_construirCasa (boolean) X 
;      construirHotel (boolean) X pagarMultaSalirCarcel (boolean) X usarTarjetaSalirCarcel (boolean)
; Rec: juego
; Tipo recursión: No aplica
(define juego-jugar-turno
  (lambda (juego valoresDados comprarPropiedad_or_construirCasa construirHotel pagarMultaSalirCarcel usarTarjetaSalirCarcel)
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
               
               [esta-en-carcel (jugador-get-esta-en-carcel jug-actual)]
               
               [jug-despues-carcel 
                (cond
                  [(and esta-en-carcel pagarMultaSalirCarcel)
                   (begin
                     (displayln "Pagando multa para salir de la cárcel...")
                     (let ([jug-paga-multa (jugador-set-dinero jug-actual (- (jugador-get-dinero jug-actual) 500))])
                       (jugador-set-esta-en-carcel jug-paga-multa #f)))]
                  
                  [(and esta-en-carcel usarTarjetaSalirCarcel (> (jugador-get-cartas-salir-carcel jug-actual) 0))
                   (begin
                     (displayln "Usando tarjeta para salir de la cárcel...")
                     (let ([jug-usa-tarjeta 
                            (jugador-set-cartas-salir-carcel 
                             jug-actual 
                             (- (jugador-get-cartas-salir-carcel jug-actual) 1))])
                       (jugador-set-esta-en-carcel jug-usa-tarjeta #f)))]
                  
                  [else jug-actual])]
                
               [esta-en-carcel-ahora (jugador-get-esta-en-carcel jug-despues-carcel)]
               
               [jug-mov (if esta-en-carcel-ahora
                            (begin
                              (displayln "El jugador sigue en la cárcel y pierde su turno.")
                              jug-despues-carcel)
                            (jugador-mover jug-despues-carcel valoresDados juego))]
               
               [pos (jugador-get-posicion jug-mov)]

               [jugs-movidos  (list-set (juego-get-jugadores juego)
                                        (jugador-get-id jug-actual)
                                        jug-mov)]
               [game-mov      (juego-set-jugadores juego jugs-movidos)]

               [casillas-especiales (tablero-get-casillas-especiales tablero)]
               [es-casilla-especial (lambda (pos)
                                      (filter (lambda (casilla) 
                                                (= (cdr casilla) pos)) 
                                              casillas-especiales))]
               [casilla-actual (es-casilla-especial pos)]
               
               [game-despues-casilla
                (if (and (not (null? casilla-actual)) (not esta-en-carcel-ahora))
                    (let ([tipo-casilla (car (car casilla-actual))])
                      (cond
                        [(equal? tipo-casilla 'carcel)
                         (begin
                           (displayln "¡Cayó en la casilla de cárcel!")
                           (let* ([jug-carcel (jugador-set-esta-en-carcel jug-mov #t)]
                                  [jugs-actualizado (list-set jugs-movidos
                                                             (jugador-get-id jug-actual)
                                                             jug-carcel)])
                             (juego-set-jugadores game-mov jugs-actualizado)))]
                        
                        [(equal? tipo-casilla 'suerte)
                         (begin
                           (displayln "¡Cayó en casilla de suerte!")
                           (let* ([resultado (juego-extraer-carta game-mov "suerte")]
                                  [nuevo-juego (car resultado)]
                                  [carta-extraida (cdr resultado)])
                             (displayln (format "Carta extraída: ~a" (carta-get-descripcion carta-extraida)))
                             nuevo-juego))]
                        
                        [(equal? tipo-casilla 'comunidad)
                         (begin
                           (displayln "¡Cayó en casilla de comunidad!")
                           (let* ([resultado (juego-extraer-carta game-mov "comunidad")]
                                  [nuevo-juego (car resultado)]
                                  [carta-extraida (cdr resultado)])
                             (displayln (format "Carta extraída: ~a" (carta-get-descripcion carta-extraida)))
                             nuevo-juego))]
                        
                        [else game-mov]))
                    game-mov)]

               [prop (tablero-get-propiedad-en-posicion tablero pos)]
               
               [game-event
                (if (and (not esta-en-carcel-ahora) prop (not (null? prop)) (not (equal? prop '())))
                    (let ([owner (propiedad-get-dueno prop)])
                      (if (or (not owner) (null? owner) (equal? owner '()))
                          (if comprarPropiedad_or_construirCasa
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
                                  (juego-set-tablero game-despues-casilla tab*) jugs*))
                              (begin
                                (displayln (format "Propiedad ~a disponible pero no se compra."
                                                   (propiedad-get-nombre prop)))
                                game-despues-casilla))

                          (if (= owner (jugador-get-id jug-mov))
                              (cond
                                [(and comprarPropiedad_or_construirCasa 
                                      (< (propiedad-get-casas prop) (juego-get-maximo-casas game-despues-casilla))
                                      (not (propiedad-get-es-hotel prop)))
                                 (let* ([precio-casa (propiedad-get-precio prop)]
                                        [dinero-jugador (jugador-get-dinero jug-mov)]
                                        [puede-pagar (>= dinero-jugador precio-casa)])
                                   (if puede-pagar
                                       (let* ([jug-desp-compra (jugador-set-dinero jug-mov (- dinero-jugador precio-casa))]
                                              [prop-con-casa  (propiedad-construir-casa prop game-despues-casilla)]
                                              [props*   (map (lambda (pp)
                                                               (if (= (propiedad-get-id (car pp))
                                                                      (propiedad-get-id prop-con-casa))
                                                                   (cons prop-con-casa (cdr pp))
                                                                   pp))
                                                             (tablero-get-propiedades tablero))]
                                              [tab*     (tablero-set-propiedades tablero props*)]
                                              [jugs*    (list-set jugs-movidos
                                                                  (jugador-get-id jug-mov)
                                                                  jug-desp-compra)])
                                         (displayln (format "Construye casa en: ~a por $~a"
                                                            (propiedad-get-nombre prop-con-casa)
                                                            precio-casa))
                                         (juego-set-jugadores
                                           (juego-set-tablero game-despues-casilla tab*) jugs*))
                                       (begin
                                         (displayln (format "No tiene suficiente dinero para construir una casa en ~a."
                                                            (propiedad-get-nombre prop)))
                                         game-despues-casilla)))]

                                [(and construirHotel 
                                      (= (propiedad-get-casas prop) (juego-get-maximo-casas game-despues-casilla))
                                      (not (propiedad-get-es-hotel prop)))
                                 (begin
                                   (let* ([prop-con-hotel (propiedad-construir-hotel prop game-despues-casilla)]
                                          [props*   (map (lambda (pp)
                                                           (if (= (propiedad-get-id (car pp))
                                                                  (propiedad-get-id prop-con-hotel))
                                                               (cons prop-con-hotel (cdr pp))
                                                               pp))
                                                         (tablero-get-propiedades tablero))]
                                          [tab*     (tablero-set-propiedades tablero props*)])
                                     (displayln (format "Construye hotel en: ~a"
                                                        (propiedad-get-nombre prop-con-hotel)))
                                     (juego-set-tablero game-despues-casilla tab*)))]

                                [else
                                 (begin
                                   (displayln (format "Cae en su propia propiedad: ~a"
                                                      (propiedad-get-nombre prop)))
                                   game-despues-casilla)])

                              (if (number? owner)
                                  (let* ([jug-rec   (list-ref (juego-get-jugadores game-despues-casilla)
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
                                    (juego-set-jugadores game-despues-casilla jugs*))
                                  game-despues-casilla))))
                    game-despues-casilla)]
                    
              [jugs-actuales (juego-get-jugadores game-event)]
              [hay-bancarrota (filter jugador-esta-en-bancarrota jugs-actuales)]
              [juego-final (if (null? hay-bancarrota)
                               (begin
                                 (displayln "Terminando turno normalmente.")
                                 game-event)
                               (begin
                                 (let ([jugador-bancarrota (car hay-bancarrota)])
                                   (displayln (format "¡~a ha entrado en bancarrota! El juego ha terminado."
                                                      (jugador-get-nombre jugador-bancarrota))))
                                 (juego-set-estado-juego game-event "terminado")))])
              
          (if (string=? (juego-get-estado-juego juego-final) "terminado")
              juego-final
              (pasar-turno juego-final))))))

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