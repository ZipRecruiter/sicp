#lang racket
; (define (min3 a b c)
;     (let ((m a))
;       (set! m (if (< b m) b m))
;       (set! m (if (< c m) c m))
;       m))


(define (minimum-of-list ls)
  (define (min2 a b) (if (< a b) a b))
  (foldl min2 (first ls) (rest ls)))

(define (minimum-of-3 a b c)
  (minimum-of-list (list a b c)))

(define (sum-of-squares-of-two-largest a b c)
  (let ((m (minimum-of-3 a b c))
        (sum-of-squares (+ (* a a) (* b b) (* c c))))
    (- sum-of-squares (* m m))))

; ; could I use fold here instead of coding the recursion explicitly?
; (define (minl ls)
;   (define (min2 a b) (if (< a b) a b))
;   (define (minl2 ls acc)
;     (if (null? ls) acc
;         (minl2 (rest ls) (min2 (first ls) acc))))
;   (minl2 (rest ls) (first ls)))


(minimum-of-3 3 4 2)