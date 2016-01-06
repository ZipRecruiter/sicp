#lang racket

(define (last-pair ls)
  (let ((rest (cdr ls)))
        (if (null? rest)
            ls
            (last-pair rest))))


(last-pair '(1 2 3 4 5))
(last-pair '(1))
