#lang racket

(require "hw1.rkt")
(require rackunit)

(define t1.1
  (test-suite
   "Exercise 1.1 / p26"
   (check-equal? 10 10)
   (check-equal? (+ 5 3 4) 12)
   (check-equal? (- 9 1) 8)
   (check-equal? (/ 6 2) 3)
   (check-equal? (+ (* 2 4) (- 4 6)) 6)
   (check-equal? (+ a b (* a b)) 19)
   (check-equal? (= a b) #f)
   (check-equal?
     (if (and (> b a) (< b (* a b)))
      b
      a)
     4)
   (check-equal?
     (cond
       ((= a 4) 6)
       ((= b 4) (+ 6 7 a))
       (else 25))
     16)
   (check-equal?
     (+ 2 (if (> b a) b a))
     6)
   (check-equal?
     (* (cond ((> a b) a)
              ((< a b) b)
              (else -1))
        (+ a 1))
     16)
    ))

(define t1.2
  (test-suite
   "Exercise 1.2 / p27"
   (check-equal?
     (/
       (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
       (* 3 (- 6 2) ( - 2 7))) -37/150)
    ))

(define t1.3
  (test-suite
   "Exercise 1.3 / p27"
   (check-equal? (sumsqr 1 1 1) 2)
   ; none equal
   (check-equal? (sumsqr 2 3 1) 13)
   (check-equal? (sumsqr 1 2 3) 13)
   (check-equal? (sumsqr 3 2 1) 13)

   ; one equal
   (check-equal? (sumsqr 2 3 2) 13)
   (check-equal? (sumsqr 2 2 3) 13)
   (check-equal? (sumsqr 3 2 2) 13)
    ))

; E1.4
; First we evaluate the expr for the if, which will result in + or - being
; selected as the first atom for the resultant expr,

; E1.5
; If it's application order, it will return 0, because it will expand the if
; and return the resulting 0, if it's normal-order it will loop forever because
; it will (incorrectly) try to expand the (p) in the else block

; E1.6
; It'll loop forever, because it will eagerly evaluate the parameters instead of
; correctly only evaluating the then/else based on the value of the expr

(require rackunit/text-ui)
;; runs the test
(run-tests t1.1)
(run-tests t1.2)
(run-tests t1.3)
