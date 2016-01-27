#lang racket

;;; as given in text
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Is this what they are looking for?
(define (count-leaves-a t)
  (accumulate (lambda (head-item tail-leaves)
                (+ (if (pair? head-item) (count-leaves head-item) 1)
                   tail-leaves))
              0
              t))

;; but no, I think they want it to look like this:
(define (count-leaves t)
  (accumulate + 0
              (map (lambda (i) 
                     (if (pair? i) (count-leaves i) 1))
                   t)))

;; Or did I miss the whole point?

(define x (cons (list 1 2) (list 3 4)))
(define y (list x x x))
(define z (cons '((((0)))) y))

(count-leaves x)
(count-leaves y)
(count-leaves z)

