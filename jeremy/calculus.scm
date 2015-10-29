#lang racket

(require rackunit)

"Part 1: Numerical integration"

"Problem 1: Integrating any function"

(define (integral func num-steps x1 x2)
    (define (deltax num-steps x1 x2) (/ (- x2 x1) num-steps))
    (define (newx1 num-steps x1 x2) (+ x1 (deltax num-steps x1 x2)))
    (define (integral-iter num-steps x1 x2 sofar)
        ;; integral(num-steps x1 x2) + sofar always equals the answer
        (cond ((= num-steps 0) sofar)
              ((= x1 x2) sofar)
              (else
                (integral-iter (- num-steps 1) (newx1 num-steps x1 x2) x2 (+ sofar (* (deltax num-steps x1 x2) (func x1)))))))
    (integral-iter num-steps x1 x2 0))

;; Test cases:

(define problem.1
    (test-suite "Tests for problem 1"
    ;; With only one step, the integral of y = x^2 from 3 to 5
    ;; should be 3^2 * 2 = 18
    (check-equal? (integral (lambda (x) (expt x 2)) 1 3 5) 18)
    ;; With two steps, we should get 3^2 + 4^2 = 25
    (check-equal? (integral (lambda (x) (expt x 2)) 2 3 5) 25)
    ))

"Problem 2: Area of a unit circle"

(define (approx-pi num-steps)
    (* 4 (integral (lambda (x) (sqrt (- 1 (* x x)))) num-steps 0 1)))

(define problem.2
    (test-suite "Tests for problem 2"
    (check-equal? (approx-pi 1) 4)
    (check-= (approx-pi 2) 3.1 0.7)
    (check-= (approx-pi 600) 3.14159 0.008) ;; Right to at least the first two decimal places?
    ))

"Problem 3: Integrating with pieces of any shape"

(define (rectangle func x1 x2)
    (* (- x2 x1) (func x1)))

(define (trapezoid func x1 x2)
    (* (- x2 x1) (+ (func x1) (func x2)) 0.5))

(define (simpsons func x1 x2)
    (/ (* (- x2 x1) (+ (func x1) (* 4 (func (/ (+ x1 x2) 2))) (func x2))) 6))

(define (integral-with piece func num-steps x1 x2)
    (define (deltax num-steps x1 x2) (/ (- x2 x1) num-steps))
    (define (newx1 num-steps x1 x2) (+ x1 (deltax num-steps x1 x2)))
    (define (integral-iter num-steps x1 x2 sofar)
        ;; integral(num-steps x1 x2) + sofar always equals the answer
        (cond ((= num-steps 0) sofar)
              ((= x1 x2) sofar)
              (else
                (integral-iter (- num-steps 1) (newx1 num-steps x1 x2) x2 (+ sofar (piece func x1 (newx1 num-steps x1 x2)))))))
    (integral-iter num-steps x1 x2 0))

;; Write your own test cases.  Start with checking that calling
;; (integral-with rectangle ...) is the same as calling (integral ...)
;; Then check that (integral-with trapezoid ...) produces better answers
;; for a given num-steps than the same (integral-with rectangle ...)

(define (square x) (expt x 2))

"rectangle"
(integral-with rectangle square 100 3 5)
(exact->inexact (integral-with rectangle square 100 3 5))
"trapezoid"
(integral-with trapezoid square 100 3 5)
"simpsons"
(integral-with simpsons square 100 3 5)
(exact->inexact (integral-with simpsons square 100 3 5))

(define problem.3
    (test-suite "Tests for problem 3"
    ;; With only one step, the integral of y = x^2 from 3 to 5
    ;; should be 3^2 * 2 = 18
    (check-equal? (integral-with rectangle square 1 3 5) 18)
    ;; With two steps, we should get 3^2 + 4^2 = 25
    (check-equal? (integral-with rectangle square 2 3 5) 25)
    (check-equal? (integral-with trapezoid square 1 3 5) 34.0)
    ;; (3^2 + 4*4^2 + 5^2) / 3 = 98/3
    (check-equal? (integral-with simpsons square 1 3 5) 98/3)
    (check-= (integral-with trapezoid square 100 3 5) 32.6666 0.001)
    (check-= (integral-with simpsons square 100 3 5) 98/3 0.000000000001)
    ))


"Problem 4: Better approximation of pi"

(define (better-pi num-steps)
    (* 4 (integral-with trapezoid (lambda (x) (sqrt (- 1 (* x x)))) num-steps 0 1)))

(define (best-pi num-steps)
    (* 4 (integral-with simpsons (lambda (x) (sqrt (- 1 (* x x)))) num-steps 0 1)))

;; How many digits does (better-pi 600) get correct, compared to
;; the earlier (approx-pi 600) ?
(approx-pi 600)
(better-pi 600)
(best-pi 600)
(define problem.4
    (test-suite "Tests for problem 4"
    (check-= (approx-pi 600) 3.1415926539 0.004)
    (check-= (better-pi 600) 3.1415926539 0.00009)
    ))


"Part 2: Symbolic differentiation"

(define (deriv-constant wrt constant)
    0)

"Problem 5: Derivative of a variable"

(define (deriv-variable wrt var)
    (cond ((eq? wrt var) 1)
          (else 0)))

"Problem 6: Calling the right function"

(define (derivative wrt expr)
    (cond
        ((number? expr) (deriv-constant wrt expr))
        ((symbol? expr) (deriv-variable wrt expr))
        ((list? expr) (cond
                        ((eq? (car expr) '+) (deriv-sum wrt expr))
                        ((eq? (car expr) '*) (deriv-product wrt expr))
                        ))
        (else (error "Don't know how to differentiate" expr))))

(define problem.6
    (test-suite "Tests for problem 5 and 6"
    (check-equal? (derivative 'x 3) 0)
    (check-equal? (derivative 'x 'x) 1)
    (check-equal? (derivative 'x 'y) 0)
    (check-exn exn:fail? (lambda () (derivative 'x "a string")))
    (check-equal? (derivative 'x '(+ x 3)) '(+ 1 0))
    (check-equal? (derivative 'x '(* x 3)) '(+ (* 1 3) (* x 0)))
    (check-equal? (derivative 'x '(* x (+ y x))) '(+ (* 1 (+ y x)) (* x (+ 0 1))))
    (check-equal? (derivative 'x '(+ (* x 3) (* x y))) '(+ (+ (* 1 3) (* x 0)) (+ (* 1 y) (* x 0))))
    ))

"Problem 7: Derivative of a sum"

(define (deriv-sum wrt expr)
    (define left-arg (cadr expr))
    (define right-arg (caddr expr))
    (quasiquote (+ (unquote (derivative wrt left-arg)) (unquote (derivative wrt right-arg)))))

"Problem 8: Derivative of a product"

(define (deriv-product wrt expr)
    (define left-arg (cadr expr))
    (define right-arg (caddr expr))
    (quasiquote (+ (* (unquote (derivative wrt left-arg)) (unquote right-arg)) (* (unquote left-arg) (unquote (derivative wrt right-arg))))))

"Problem 9: Additional testing"

; Additional test cases for 'derivative' go here.

(require rackunit/text-ui)

(run-tests problem.1)
(run-tests problem.2)
(run-tests problem.3)
(run-tests problem.4)
(run-tests problem.6)
