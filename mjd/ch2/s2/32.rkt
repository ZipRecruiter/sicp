#lang racket

(define test-set '(1 2 3))

(define (power-set s)
  (if (null? s)
      '(())  ; one empty subset
      (let ((ss (power-set (cdr s))))
        (append (map (lambda (x) (cons (car s) x)) ss)
                ss))))

(define subsets power-set)

(power-set test-set)

      
