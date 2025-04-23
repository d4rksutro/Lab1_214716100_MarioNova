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
         jugador-quitar-propiedad)

(define jugador
  (lambda (id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
    (list id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)))

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

(define jugador-get-id
  (lambda (jugador)
    (first jugador)))

(define jugador-get-nombre
  (lambda (jugador)
    (second jugador)))


(define jugador-get-dinero
  (lambda (jugador)
    (third jugador)))

(define jugador-get-propiedades
  (lambda (jugador)
    (fourth jugador)))

(define jugador-get-posicion
  (lambda (jugador)
    (fifth jugador)))

(define jugador-get-esta-en-carcel
  (lambda (jugador)
    (sixth jugador)))

(define jugador-get-cartas-salir-carcel
  (lambda (jugador)
    (seventh jugador)))

(define jugador-set-dinero
  (lambda (jugador dinero)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          dinero
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))

(define jugador-set-posicion
  (lambda (jugador posicion)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          posicion
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))

(define jugador-set-esta-en-carcel
  (lambda (jugador estaEnCarcel)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          estaEnCarcel
          (jugador-get-cartas-salir-carcel jugador))))

(define jugador-set-cartas-salir-carcel
  (lambda (jugador cartasSalirCarcel)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (jugador-get-propiedades jugador)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          cartasSalirCarcel)))

(define jugador-agregar-propiedad
  (lambda (jugador propiedad)
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (append (jugador-get-propiedades jugador) (list propiedad))
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))


(define jugador-quitar-propiedad
  (lambda (jugador id-propiedad)
    (define filtro-props
      (lambda (props id)
        (if (null? props)
            '()
            (let ([primera (first props)])
              (if (= (first primera) id)
                  (filtro-props (rest props) id)
                  (cons primera (filtro-props (rest props) id)))))))
    
    (list (jugador-get-id jugador)
          (jugador-get-nombre jugador)
          (jugador-get-dinero jugador)
          (filtro-props (jugador-get-propiedades jugador) id-propiedad)
          (jugador-get-posicion jugador)
          (jugador-get-esta-en-carcel jugador)
          (jugador-get-cartas-salir-carcel jugador))))


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