#lang racket

;;; as given in text

;; Accumulate
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; (fold-right / 1 (list 1 2 3)) ;      ==>  3/2 
; (fold-left / 1 (list 1 2 3))  ;      ==>  1/6
; (fold-right list nil (list 1 2 3))   ==>  (((() 1) 2) 3)
; (fold-left list nil (list 1 2 3))    ==>  (1 2 3 ())

; ((((0 - 1) - 2) - 3) - 4)
(fold-left - 0 '(1 2 3 4))
; (1 - (2 - (3 - (4 - 0))))
(fold-right - 0 '(1 2 3 4))

(fold-left cons 'x '(1 2 3 4))
(fold-right cons 'x '(1 2 3 4))

(define (abs x) (if (> 0 x) x (- x)))
(define (dist a b) (abs (- a b)))

(fold-left dist 17 '(1 2))
(fold-right dist 17 '(1 2))
