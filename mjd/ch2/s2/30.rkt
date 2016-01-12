#lang racket

(define test-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (tree-map f tree)
  (if (list? tree)
      (map (lambda (node) (tree-map f node)) tree)
      (f tree)))

(define (scale-tree tree factor)
  (tree-map (lambda (x) (* x factor)) tree))

(scale-tree test-tree 10)
;; => (10 (20 (30 40) 50) (60 70))

(define (square x) (* x x))

(define (square-tree tree)
  (tree-map square tree))

(square-tree test-tree)
;; => (1 (4 (9 16) 25) (36 49))








