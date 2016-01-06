#lang racket
(define (square n) (* n n))
(define nil (list))

(define (square-list-a items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-a (cdr items)))))

(define (square-list-b items)
  (map square items))

;; Haskell: square-list = map square

(square-list-a (list 1 2 3 4))

(square-list-b (list 1 2 3 4))
