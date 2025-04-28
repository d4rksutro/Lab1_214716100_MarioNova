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

; Descripción: Construir el TDA Propiedad
; Dom: id (int) X nombre (string) X precio (int) X renta (int) X dueno (id_jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean)
; Rec: propiedad
; Tipo recursión: No aplica
(define propiedad
  (lambda (id nombre precio renta dueno casas esHotel estaHipotecada)
    (list id nombre precio renta dueno casas esHotel estaHipotecada)))

; Descripción: Verificar si un elemento es una propiedad
; Dom: elemento (any)
; Rec: boolean
; Tipo recursión: No aplica
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

; Descripción: Obtener el ID de la propiedad
; Dom: propiedad (propiedad)
; Rec: int
; Tipo recursión: No aplica
(define propiedad-get-id first)

; Descripción: Obtener el nombre de la propiedad
; Dom: propiedad (propiedad)
; Rec: string
; Tipo recursión: No aplica
(define propiedad-get-nombre second)

; Descripción: Obtener el precio de la propiedad
; Dom: propiedad (propiedad)
; Rec: int
; Tipo recursión: No aplica
(define propiedad-get-precio third)

; Descripción: Obtener la renta base de la propiedad
; Dom: propiedad (propiedad)
; Rec: int
; Tipo recursión: No aplica
(define propiedad-get-renta fourth)

; Descripción: Obtener el ID del dueño de la propiedad o null si no tiene
; Dom: propiedad (propiedad)
; Rec: int o null
; Tipo recursión: No aplica
(define propiedad-get-dueno fifth)

; Descripción: Obtener la cantidad de casas en la propiedad
; Dom: propiedad (propiedad)
; Rec: int
; Tipo recursión: No aplica
(define propiedad-get-casas sixth)

; Descripción: Obtener si la propiedad tiene hotel
; Dom: propiedad (propiedad)
; Rec: boolean
; Tipo recursión: No aplica
(define propiedad-get-es-hotel seventh)

; Descripción: Obtener si la propiedad está hipotecada
; Dom: propiedad (propiedad)
; Rec: boolean
; Tipo recursión: No aplica
(define propiedad-get-esta-hipotecada eighth)

; Descripción: Cambiar el dueño de la propiedad
; Dom: propiedad (propiedad) X dueno (int/null)
; Rec: propiedad
; Tipo recursión: No aplica
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

; Descripción: Cambiar el número de casas de la propiedad
; Dom: propiedad (propiedad) X casas (int)
; Rec: propiedad
; Tipo recursión: No aplica
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

; Descripción: Cambiar si la propiedad tiene hotel
; Dom: propiedad (propiedad) X esHotel (boolean)
; Rec: propiedad
; Tipo recursión: No aplica
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

; Descripción: Cambiar si la propiedad está hipotecada
; Dom: propiedad (propiedad) X estaHipotecada (boolean)
; Rec: propiedad
; Tipo recursión: No aplica
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
		  
; Descripción: Calcular la renta de una propiedad según el número de casas y hotel
; Dom: propiedad (propiedad)
; Rec: int (monto de la renta)
; Tipo recursión: No aplica
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

; Descripción: Hipotecar una propiedad
; Dom: propiedad (propiedad)
; Rec: propiedad
; Tipo recursión: No aplica
(define propiedad-hipotecar
  (lambda (propiedad)
    (if (not (propiedad-get-esta-hipotecada propiedad))
        (propiedad-set-esta-hipotecada propiedad #t)
        propiedad)))