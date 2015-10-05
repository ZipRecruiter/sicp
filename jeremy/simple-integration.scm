#lang racket

(require rackunit)

"Part 1: Numerical integration"

"Problem 1: Bitdiddle's function"

(define (bitfunc x)
    (+ (expt x 4) (* -5 (expt x 2)) 4))

;; Some simple test cases, based on by-eye examination of a graph of the
;; function: https://www.google.com/search?q=x^4-5*x^2%2B4   Run these,
;; and check that they match with the expectations.
(define problem.1
    (test-suite "Tests for problem 1"
    (check-equal? (bitfunc 0) 4)
    (check-equal? (bitfunc 1) 0)
    (check-equal? (bitfunc 2) 0)
    (check-equal? (bitfunc -1) 0)
    (check > (bitfunc 10) 0 9000)
    ))

"Problem 2: A rectangle under Bitdiddle's function"

(define (bitfunc-rect x1 x2)
    (* (- x2 x1) (bitfunc x1)))

;; Test cases:
(define problem.2
    (test-suite "Tests for problem 2"
    (check-equal? (bitfunc-rect 0 1) 4)
    (check-equal? (bitfunc-rect 0 0.5) 2.0)
    (check < (bitfunc-rect 1.5 2) 0) ;; Should be negative
    ))

"Problem 3: Integrating Bitdiddle's function"

(define (deltax num-steps x1 x2) (/ (- x2 x1) num-steps))
(define (newx1 num-steps x1 x2) (+ x1 (deltax num-steps x1 x2)))

(define (bitfunc-integral-recur num-steps x1 x2)
    (cond ((= num-steps 0) 0)
          ((= x1 x2) 0)
          (else
             (+ (* (deltax num-steps x1 x2) (bitfunc x1)) (bitfunc-integral-recur (- num-steps 1) (newx1 num-steps x1 x2) x2)))))

(define (bitfunc-integral-iter num-steps x1 x2)
    (define (internal-iter num-steps x1 x2 sofar)
        ;; integral(num-steps x1 x2) + sofar always equals the answer
        (cond ((= num-steps 0) sofar)
              ((= x1 x2) sofar)
              (else
                (internal-iter (- num-steps 1) (newx1 num-steps x1 x2) x2 (+ sofar (* (deltax num-steps x1 x2) (bitfunc x1)))))))
    (internal-iter num-steps x1 x2 0))

;; Provide your own test cases for this function.  Think about what are
;; the simplest input values to know are correct, and show that those
;; work as expected before moving on to test a couple more complicated
;; situations.
(define problem.3
    (test-suite "Tests for problem 3"
    (check-equal? (bitfunc-integral-recur 0 0 1) 0)
    (check-equal? (bitfunc-integral-recur 1 0 1) 4)
    (check-= (bitfunc-integral-recur 1000 0 1) 2.533 0.01)
    (check-equal? (bitfunc-integral-iter 0 0 1) 0)
    (check-equal? (bitfunc-integral-iter 1 0 1) 4)
    (check-= (bitfunc-integral-iter 1000 0 1) 2.533 0.01)
    ))


"Problem 4: Comparing the two integrators"

(define (bitfunc-integral-difference num-steps x1 x2)
    (abs (- (bitfunc-integral-iter num-steps x1 x2) (bitfunc-integral-recur num-steps x1 x2))))

;; ;; Provide test cases for this one as well; only a couple should be
;; ;; needed, as this function should be fairly straightforward.
(define problem.4
    (test-suite "Tests for problem 4"
    (check-equal? (bitfunc-integral-difference 0 0 1) 0)
    (check-equal? (bitfunc-integral-difference 1 0 1) 0)
    (check-equal? (bitfunc-integral-difference 1000 0 1) 0)
    ))

(require rackunit/text-ui)

(run-tests problem.1)
(run-tests problem.2)
(run-tests problem.3)
(run-tests problem.4)
