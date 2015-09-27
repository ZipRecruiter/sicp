#lang racket

(define (choose n k)
  (cond ((= k 0) 1)
        ((= k n) 1)
        ((< k 0) 0)
        ((> k n) 0)
        (else (+ (choose (sub1 n) (sub1 k))
                 (choose (sub1 n) k)))))

(map choose '(6 6 6 6 6 6 6) '(0 1 2 3 4 5 6))