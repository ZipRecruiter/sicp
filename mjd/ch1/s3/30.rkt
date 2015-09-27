#lang racket
(define (sum-recurse term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recurse term (next a) next b))))

(define (sum-iterate term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(sum-recurse 
 (lambda (n) (* n n))
 1
 (lambda (n) (+ n 2))
 20)


(sum-iterate 
 (lambda (n) (* n n))
 1
 (lambda (n) (+ n 2))
 20)