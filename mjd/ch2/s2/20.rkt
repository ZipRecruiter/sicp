#lang racket
;(define (same-parity a1 . rest)
;  (cond ((null? rest)
;         (list a1))
;        ((= (modulo a1 2) (modulo (car rest) 2))
;         (cons a1 (same-parity rest)))
;        (else (same-parity (list a1 (cdr rest))))))

(define (same-parity a1 . rest)
  (define (correct-parity n)
    (= (modulo n 2)
       (modulo a1 2)))
  (cons a1 (filter correct-parity rest)))

(same-parity 1 2 3 4 5 6 7) ; => (1 3 5 7)
(same-parity 2 3 4 5 6 7) ; => (2 4 6)
(same-parity 3) ; => (3)
