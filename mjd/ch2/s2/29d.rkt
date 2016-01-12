#lang racket

(define (make-mobile left right)
  (cons left right))  ;; ***

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

; a structure is either an integer weight or an entire mobile
(define (branched? structure)
  (pair? structure))

(define (make-branch length structure)
  (cons length structure)) ;; ***

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))


;;;
;;; 

(define (total-branch-weight branch)
  (total-weight (branch-structure branch)))

(define (total-weight mobile)
  (if (branched? mobile)
      (+ (total-branch-weight (left-branch mobile))
         (total-branch-weight (right-branch mobile)))
      mobile))

(define test-mobile 
  (make-mobile (make-branch 1 10)
               (make-branch 2 (make-mobile (make-branch 3 20)
                                           (make-branch 4 30)))))

(total-weight test-mobile) ; => 60

(define test-balanced-mobile 
  (make-mobile (make-branch 7 10)
               (make-branch 1 (make-mobile (make-branch 3 40)
                                           (make-branch 4 30)))))

(total-weight test-balanced-mobile) ; => 80

;;;
;;; 

(define (torque branch)
  (* (branch-length branch)
     (total-branch-weight branch)))

(define (balanced? mobile)
  (if (branched? mobile)
      (and (= (torque (left-branch mobile))
              (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))
      #t))

(balanced? test-mobile) ; ==> #f
(balanced? test-balanced-mobile) ; ==> #t




