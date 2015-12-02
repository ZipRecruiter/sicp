#lang racket

;;; Points

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;;; Lines

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s) 
  (define (mean2 a b) (/ (+ a b) 2))
  (make-point (mean2 (x-point (start-segment s))
                     (x-point (end-segment s)))
              (mean2 (y-point (start-segment s))
                     (y-point (end-segment s)))))
(define (print-segment s)
  (newline)
  (display "segment from ")
  (print-point (start-segment s))
  (display " to ")
  (print-point (end-segment s))
)

; In Haskell:
;   print_midpoint = print_point . midpoint_segment
(define (print-midpoint s)
  (print-point (midpoint-segment s)))

(define ex-s (make-segment (make-point 0 0)
                           (make-point 6 8)))

(print-segment ex-s)
(newline)
(display "midpoint: ")
(print-midpoint ex-s)
