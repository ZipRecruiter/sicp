#lang racket

(define (f-recursive n)
  (if (< n 3) 
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f a b c k)
    (if (= k n)
        a
        (f b c (+ (* 3 a) (* 2 b) c) (add1 k))))
  (f 0 1 2 0))

(f-recursive 17)
(f-iterative 17)
