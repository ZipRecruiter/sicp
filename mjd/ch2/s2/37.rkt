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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; constraint: v and w have the same length
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; constraint: columns of m equals elements of v
; result: vector with one element per row of m
;         each element is the dot product of v with a row of m
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define r '((1 2 3) (4 5 6)))
(define s '((1 2) (3 4)))
(define i '((1 0) (0 1)))
(define t '((0 1) (1 0)))

(matrix-*-matrix s s)
(matrix-*-matrix '((1 2)) '((3) (4)))
(matrix-*-matrix '((3) (4)) '((1 2)) )
