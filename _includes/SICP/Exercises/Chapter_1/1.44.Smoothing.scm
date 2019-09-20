;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.44
;; Smoothing and repeating
(define dx 0.00001)
(define (avg x y z)
  (/ (+ x y z) 3))

(define (smooth f)  
  (lambda (x)
    ;; Do the smoothing
    (avg (f (- x dx)) (f x) (f (+ x dx)))))

(define (repeated f n)  
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
