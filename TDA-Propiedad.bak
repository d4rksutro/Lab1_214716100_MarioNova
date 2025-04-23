#lang racket


(provide propiedad
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
         propiedad-set-esta-hipotecada)


(define propiedad
  (lambda (id nombre precio renta dueno casas esHotel estaHipotecada)
    (list id nombre precio renta dueno casas esHotel estaHipotecada)))


(define propiedad?
  (lambda (elemento)
    (if (list? elemento)
        (if (= (length elemento) 8)
            (and (number? (first elemento))
                 (string? (second elemento))
                 (number? (third elemento))
                 (number? (fourth elemento))
                 (number? (sixth elemento))
                 (boolean? (seventh elemento))
                 (boolean? (eighth elemento)))
            #f)
        #f)))


(define propiedad-get-id first)


(define propiedad-get-nombre second)


(define propiedad-get-precio third)


(define propiedad-get-renta fourth)


(define propiedad-get-dueno fifth)


(define propiedad-get-casas sixth)


(define propiedad-get-es-hotel seventh)


(define propiedad-get-esta-hipotecada eighth)


(define propiedad-set-dueno
  (lambda (propiedad dueno)
    (list (propiedad-get-id propiedad)
          (propiedad-get-nombre propiedad)
          (propiedad-get-precio propiedad)
          (propiedad-get-renta propiedad)
          dueno
          (propiedad-get-casas propiedad)
          (propiedad-get-es-hotel propiedad)
          (propiedad-get-esta-hipotecada propiedad))))


(define propiedad-set-casas
  (lambda (propiedad casas)
    (list (propiedad-get-id propiedad)
          (propiedad-get-nombre propiedad)
          (propiedad-get-precio propiedad)
          (propiedad-get-renta propiedad)
          (propiedad-get-dueno propiedad)
          casas
          (propiedad-get-es-hotel propiedad)
          (propiedad-get-esta-hipotecada propiedad))))


(define propiedad-set-es-hotel
  (lambda (propiedad esHotel)
    (list (propiedad-get-id propiedad)
          (propiedad-get-nombre propiedad)
          (propiedad-get-precio propiedad)
          (propiedad-get-renta propiedad)
          (propiedad-get-dueno propiedad)
          (propiedad-get-casas propiedad)
          esHotel
          (propiedad-get-esta-hipotecada propiedad))))


(define propiedad-set-esta-hipotecada
  (lambda (propiedad estaHipotecada)
    (list (propiedad-get-id propiedad)
          (propiedad-get-nombre propiedad)
          (propiedad-get-precio propiedad)
          (propiedad-get-renta propiedad)
          (propiedad-get-dueno propiedad)
          (propiedad-get-casas propiedad)
          (propiedad-get-es-hotel propiedad)
          estaHipotecada)))