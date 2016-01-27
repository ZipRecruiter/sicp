#lang racket

;;; as given in text
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ (* x higher-terms) this-coeff))   ;; THIS
              0
              coefficient-sequence))

(define p '(1 0 1))  ; x^2 + 1

(map (lambda (x) (horner-eval x p)) '(0 1 2 3 4 5 6 7 8 9))
