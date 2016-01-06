;; quick-and-dirty, not tested or even syntax-checked, several exercises in one file from me and Andrew and Michael

(define (repeated f n)
  (if (eq? n 0)
      (lambda (x) x)
      (if (even? n)
        (let ((f2 (repeated f (/ n 2))))
          (compose f2 f2))
        (compose f (repeated f (- n 1))))))

((repeated square 3) 5) ; (square (square (square (5)))) == 5**(2**3) == 5**8

(define (smooth f dx)
 (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
)

(define (nsmooth f dx n)
  (let (((fakesmooth) (lambda (g) (smooth g dx))))
    ((repeated fakesmooth n) f)))
