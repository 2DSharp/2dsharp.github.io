;; SICP- Second Edition
;; Exercise 1.31.a
;; Author- Dedipyaman Das (2d@twodee.me)
;; Higher order product of series
;; Factorial and Pi calculation
;; Recursive process
(define (1+ x) (+ 1 x))
(define (identity x) x)

(define (product low high term next)
  (if (> low high)
      1
      (* (term low) (product (next low) high term next))))

(define (factorial n)
  (product 1 n identity 1+))

(define (pi-product n)
  ;; Simplifying the term we get
  ;; term = (1 - 1/k^2)
  (define (pi-term k)
    (- 1 (/ 1.0 (square k))))
  (define (pi-next k)
    (+ 2 k))
  (* 4 (product 3 n pi-term pi-next)))
