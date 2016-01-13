#lang racket

;;  extract the 7 with car and cdr


;; 25.a: (1 3 (5 7) 9)
(define a (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr a)))))  ;; => 7

;; 25.b: ((7))
(define b (list (list 7)))
(car (car b))  ;; => 7

;; 25.c: (1 (2 (3 (4 (5 (6 7 ))))))
(define c '(1 (2 (3 (4 (5 (6 7 )))))))  ;; => `(1 (2 (3 (4 (5 (6 7))))))

(car (cdr
       (car (cdr
              (car ( cdr
                     (car (cdr
                            (car (cdr
                                   (car (cdr c)))))))))))) ;; => 7
