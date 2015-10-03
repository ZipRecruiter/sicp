#lang racket

(require rackunit)

(define (fast-expt-iter a b n)
        ;; a*(b**n) is always the answer
        (cond ((= n 0) a)
              ((even? n) (fast-expt-iter a (* b b) (/ n 2)))
              (else (fast-expt-iter (* a b) b (- n 1)))))

(define (fast-expt b n)
        (fast-expt-iter 1 b n))

(define t1.16
    (test-suite "Tests for exercise 1.16"
    (check-= (fast-expt 123 0) 1 1e-6)
    (check-= (fast-expt 2 10) 1024 1e-6)
    (check-= (fast-expt 10 6) 1e6 1e-6)
    (check-= (fast-expt .01 3) 1e-6 1e-18)
    ))

(require rackunit/text-ui)

(run-tests t1.16)
