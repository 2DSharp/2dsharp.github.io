;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; General higher order summation procedure

(define (summation low high term next)
  (if (> low high)
      0
      (+ (term low) (summation (next low) high term next))))

;; The summation converges to pi/8
;; Multiplying by 8 gives an approximation to pi
(define (pi-sum low high)
  (define (pi-term term)
    (/ 1.0 (* term (+ term 2))))
  (define (pi-next term)
    (+ 4 term))
  (* 8 (summation low high pi-term pi-next)))

(define (1+ x) (+ 1 x))

;; Add low, low+1... high
(define (sum-int low high)
  (summation low high identity 1+))

;; Cube sum
(define (cube a) (* a a a))
(define (identity x) x)

(define (cube-sum low high)
  (summation low high cube 1+))
;; Definite integral of a given function
(define (integral low high function dx)
  (define (int-next a)
    (+ a dx))
  (* (summation (+ low (/ dx 2)) high function int-next) dx))
