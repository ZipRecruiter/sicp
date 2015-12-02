#lang racket

(require rackunit)

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3))))))

(define (f-iter n)
        (define (f-iter-iter f-3 f-2 f-1 n)
                (cond ((= n 0) f-3)
                      (else (f-iter-iter f-2 f-1 (+ f-1 (* 2 f-2) (* 3 f-3)) (- n 1)))))
        (f-iter-iter 0 1 2 n))

(define t1.11
    (test-suite "Tests for exercise 1.11"
    (check-equal? (f-recur 0) 0)
    (check-equal? (f-recur 1) 1)
    (check-equal? (f-recur 2) 2)
    (check-equal? (f-recur 3) 4)
    (check-equal? (f-recur 4) 11)
    (check-equal? (f-recur 5) 25)
    (check-equal? (f-iter 0) 0)
    (check-equal? (f-iter 1) 1)
    (check-equal? (f-iter 2) 2)
    (check-equal? (f-iter 3) 4)
    (check-equal? (f-iter 4) 11)
    (check-equal? (f-iter 5) 25)
    ))

(require rackunit/text-ui)

(run-tests t1.11)
