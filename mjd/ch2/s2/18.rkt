#lang racket

(define (reverse ls)
  (define (reverse-iter ls acc)
    (if (null? ls)
        acc
        (reverse-iter (cdr ls) (cons (car ls) acc))))
  (reverse-iter ls '()))

(reverse '())
(reverse '(1))
(reverse '(1 2 3 4 5))
