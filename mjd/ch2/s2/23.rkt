#lang racket

(define for-each map)

; Or if you insist
;(define (for-each proc ls)
;  (map proc ls)
;  #t)
  

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

