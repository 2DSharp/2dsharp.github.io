;; SICP- Second Edition
;; Exercise 1.12
;; Author- Dedipyaman Das (2d@twodee.me)
;; Iterative process
(define (pascal-triangle row column)
  (if (or (= column 1) (= column row))
      1
      (+ (pascal-triangle (- row 1) column) (pascal-triangle (- row 1) (- column 1)))))


