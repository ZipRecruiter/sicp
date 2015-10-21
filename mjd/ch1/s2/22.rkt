#lang racket
(define (square n) (* n n))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;;;;--------------------------------

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ") 
  (display elapsed-time)
  (newline))

(define runtime current-inexact-milliseconds)

(define (smallest-prime-exceeding min)
  (let ((n (if (odd? min) min (add1 min))))  
    (if (prime? n)
        (timed-prime-test n)
        (smallest-prime-exceeding (+ 2 n)))))

(smallest-prime-exceeding 1000)
(smallest-prime-exceeding 100000)
(smallest-prime-exceeding 10000000)
(smallest-prime-exceeding 1000000000)
(smallest-prime-exceeding 100000000000)
(smallest-prime-exceeding 10000000000000)
