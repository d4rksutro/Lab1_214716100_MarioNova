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
         propiedad-set-esta-hipotecada
         propiedad-calcular-renta
         propiedad-hipotecar)


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


(define propiedad-calcular-renta
  (lambda (propiedad)
    (if (propiedad-get-esta-hipotecada propiedad)
        0
        (let ([renta-base (propiedad-get-renta propiedad)]
              [num-casas (propiedad-get-casas propiedad)]
              [es-hotel (propiedad-get-es-hotel propiedad)])
          (cond
            [(= num-casas 0) renta-base]
            [(= num-casas 1) (* renta-base 4)]
            [(= num-casas 2) (* renta-base 12)]
            [(= num-casas 3) (* renta-base 30)]
            [(= num-casas 4) (* renta-base 45)]
            [es-hotel (* renta-base 65)]
            [else renta-base])))))

(define propiedad-calcular-renta
  (lambda (propiedad)
    (if (propiedad-get-esta-hipotecada propiedad)
        0
        (let ([renta-base (propiedad-get-renta propiedad)]
              [num-casas (propiedad-get-casas propiedad)]
              [es-hotel (propiedad-get-es-hotel propiedad)])
          (cond
            [(= num-casas 0) renta-base] 
            [(= num-casas 1) (* renta-base 4)]
            [(= num-casas 2) (* renta-base 12)]
            [(= num-casas 3) (* renta-base 30)]
            [(= num-casas 4) (* renta-base 45)]
            [es-hotel (* renta-base 65)]
            [else renta-base])))))   


(define propiedad-hipotecar
  (lambda (propiedad)
    (if (not (propiedad-get-esta-hipotecada propiedad))
        (propiedad-set-esta-hipotecada propiedad #t)
        propiedad)))