#lang racket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (deb s)
  (display "# ")
  (display s)
  (newline))

;;;; This definition sucks
(define (integral-simpson-sucks f a b n)
  (and (odd? n) (error "n must be even")) ; weird Racketism
  (and (> a b) (error "a may not exceed b")) ; This condition sucks
  (let ((h (/ (- b a) n)))
;    (deb h)
    (define (add-h x) (+ x h))
    (define (add-2h x) (+ x (* 2 h)))
    (define (two-terms y)
      (+ (* 2 (f y))
         (* 4 (f (add-h y)))))
    (let ((pre-sum (sum two-terms a add-2h (- b h)))) ; 2f(y_0)
;      (deb pre-sum)
      (* h (+ (- pre-sum (f a)) (f b)) (/ 1.0 3.0)))))

;;;; This one is better
(define (integral-simpson f a b n)
  (and (odd? n) (error "n must be even")) ; weird Racketism
  (define h (/ (- b a) n))
  (define (term-coeff k)
    (cond ((zero? k) 1)
          ((odd? k) 4)
          (else 2)))
  (define (argument k) (+ a (* k h)))
  (define (term k)
    (* (term-coeff k) (f (argument k))))
  ;; f(y_0) + 4f(y_1) + 2f(y_2) + ... + 2f(y_n)
  (define pre-sum (sum term 0 (lambda (n) (+ n 1)) n))
  (* (/ h 3.0) (- pre-sum (f (argument n)))))

(define (cube x) (* x x x))
(define (square x) (* x x))
(define (id x) (displayln x) x)
(integral cube 0 1  0.01)
(integral-simpson-sucks cube 0 1 100)
(integral-simpson cube  0 1 10)
