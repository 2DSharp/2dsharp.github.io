;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Factorial implementation
;; Recursive process
;; Calculuates n! by calculating n * (n-1)!
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
