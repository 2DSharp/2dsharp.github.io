;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.2
;; Normalizing the output of make-rat

;; Line segment
;; Constructor
(define (make-segment start end)
  (cons start end))
;; Selectors
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

;; Point
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;; Given
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Midpoint -  Average of the endpoints
(define (midpoint-segment segment)
  (define (average a b)
    (/ (+ a b) 2))
  (let ((start (start-segment segment))
	(end (end-segment segment)))
    ;; Averages of the x-endpoints and y-endpoints
    (make-point (average (x-point start) (x-point end))
		(average (y-point start) (y-point end)))))
