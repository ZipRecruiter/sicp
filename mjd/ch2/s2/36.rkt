#lang racket

;;; as given in text
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))      ;; THIS
            (accumulate-n op init (map cdr seqs))))) ;; THIS

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(accumulate-n + 0 s)
