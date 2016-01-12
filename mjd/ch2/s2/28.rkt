#lang racket

(define x (list (list 1 2) (list 3 4)))


(define (fringe ls)
  (cond 
   ((null? ls) '())
   ((pair? ls)
    (append (fringe (car ls))
            (fringe (cdr ls))))
   (else (list ls))))

(fringe x) ; => (1 2 3 4)

(fringe (list x x)) ; => (1 2 3 4 1 2 3 4)

(fringe (cons x x)) ; => (1 2 3 4 1 2 3 4)

(fringe '((1 2 3) (4 5 6))) ; => (1 2 3 4 5 6)

(fringe '(1 2 3 4 5 6)) ; => (1 2 3 4 5 6)

(fringe '((1 2 3) (4 5) 6)) ; => (1 2 3 4 5 6)

(fringe '(((((1 2 3 4)) 5)) 6)) ; => (1 2 3 4 5 6)

