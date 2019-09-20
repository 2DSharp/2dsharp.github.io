;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.6
;; Implementing church numerals
;; Number representations with procedures

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (+ addend n)
  (lambda (f) (lambda (x)
		((addend f) ((n f) x)))))
