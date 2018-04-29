;; SICP- Second Edition
;; Exercise 1.11
;; Author- Dedipyaman Das (2d@twodee.me)
;; Recursive process- pretty simple

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
