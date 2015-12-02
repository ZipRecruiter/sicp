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

;;; Rectangles

(define (make-rectangle p1 p2)
  (define (min2 a b) (if (< a b) a b))
  (define (max2 a b) (if (< a b) b a))
  (let* ((y1 (y-point p1))
         (y2 (y-point p2))
         (x1 (x-point p1))
         (x2 (x-point p2))
         (tl (make-point (min2 x1 x2)
                         (min2 y1 y2)))
         (br (make-point (max2 x1 x2)
                         (max2 y1 y2))))
    (cons tl br)))

(define (rectangle-top-left r) 
  (car r))

(define (rectangle-bottom-right r) 
  (cdr r))

(define (rectangle-top r)
  (y-point (rectangle-top-left r)))

(define (rectangle-bottom r)
  (y-point (rectangle-bottom-right r)))

(define (rectangle-left r)
  (x-point (rectangle-top-left r)))

(define (rectangle-right r)
  (x-point (rectangle-bottom-right r)))

(define (rectangle-height r)
  (- (rectangle-bottom r) (rectangle-top r)))

(define (rectangle-width r)
  (- (rectangle-right r) (rectangle-left r)))

(define (perimeter r)
  (* 2 (+ (rectangle-height r)
          (rectangle-width r))))

(define (area r)
  (* (rectangle-height r)
     (rectangle-width r)))

(define rect1 (make-rectangle (make-point 1 1)
                              (make-point 3 3)))
(define rect2 (make-rectangle (make-point 1 3)
                              (make-point 3 1)))

(define (print-rect-vitals  r)
  (newline)
  (display "Perimeter: ")
  (display (perimeter r))
  (display " Area: ")
  (display (area r)))

(print-rect-vitals rect1)
(print-rect-vitals rect2)
