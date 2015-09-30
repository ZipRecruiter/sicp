#lang racket
(define (expt b n)
  (if (zero? n)
      1
      (* b (expt b (sub1 n)))))
(map expt '(7 7 7 7 7) '(0 1 2 3 4))

(define (fast-expt b n)
  (cond ((zero? n) 1)
        ((= n 1) b)
        (else
         (let* ((e (fast-expt b (quotient n 2)))
                (e-squared (* e e)))
           (if (even? n)
               e-squared
               (* e-squared b))))))

(map fast-expt '(7 7 7 7 7) '(0 1 2 3 4))

(define (fast-expt-iter b n)
  (define (it base expt acc)
    (cond ((zero? expt) acc)
          ((even? expt) (it (* base base) (/ expt 2) acc))
          (else (it base (sub1 expt) (* base acc)))))
  (it b n 1))

(map fast-expt-iter '(7 7 7 7 7) '(0 1 2 3 4))
