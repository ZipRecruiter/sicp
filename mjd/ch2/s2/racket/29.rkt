#lang racket

(struct branch (length structure))
(struct mobile (left-branch right-branch))

(define (total-branch-weight branch)
  (total-weight (branch-structure branch)))

(define (total-weight str)
  (match str
         [ (mobile lt rt) (+ (total-branch-weight lt)
                             (total-branch-weight rt)) ]
         [ weight weight ]))

(define test-mobile (mobile (branch 1 10)
                            (branch 2 (mobile (branch 3 20)
                                              (branch 4 30)))))

(define test-balanced-mobile (mobile (branch 7 10)
                                     (branch 1 (mobile (branch 3 40)
                                                       (branch 4 30)))))

(define (torque br)
  (match br
         [ (branch len _) (* len (total-branch-weight br)) ]))

(define (balanced? str)
  (match str
         [ (mobile lt rt)
           (and (= (torque lt) (torque rt))
                (balanced? (branch-structure lt))
                (balanced? (branch-structure rt))) ]
         [ _ #t ]))

(balanced? test-mobile)
(balanced? test-balanced-mobile)
