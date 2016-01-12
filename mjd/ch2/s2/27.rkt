#lang racket

(define (reverse ls)
  (define (reverse-iter ls acc)
    (if (null? ls)
        acc
        (reverse-iter (cdr ls) (cons (car ls) acc))))
  (reverse-iter ls '()))

(define (deep-reverse ls)
  (if (pair? ls)
      (map deep-reverse (reverse ls))
      ls))

(define x (list (list 1 2) (list 3 4)))

x
; ((1 2) (3 4))

(reverse x)
; ((3 4) (1 2))

(deep-reverse '())
; ()

(deep-reverse '(1))
; (1)

(deep-reverse '((1) (2) (3)))
; ((3) (2) (1))

(deep-reverse '((1 2 3) (4 5) 6))
; (6 (5 4) (3 2 1))

(deep-reverse '((((1 2 3 4)))))
; ((((4 3 2 1))))

(deep-reverse '(1 2 3 4))
; (1 2 3 4)

(deep-reverse x)
; ((4 3) (2 1))
