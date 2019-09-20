;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.3
;; Rectangle representations on a plane

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

(define (length-seg rect)
  (car rect))
(define (breadth-seg rect)
  (cdr rect))
(define (size segment)
  (let ((start (start-segment segment))
	(end (end-segment segment)))
    (sqrt (+ (square (- (x-point start) (x-point end)))
	     (square (- (y-point start) (y-point end)))))))
;; The required procedures
(define (perimeter length breadth)
  (* 2 (+ length breadth)))
(define (area length breadth)
  (* length breadth))

;; Implementation
;; Taking explicit length and breadth line segments
(define (make-rect1 length-seg breadth-seg)
  (cons length-seg breadth-seg))

(define (rect1calc rect f)
  ;; Although the following let is unnecessary, it adds a bit of readability
  (let ((length (size (length-seg rect)))
	(breadth (size (breadth-seg rect))))
    (f length breadth)))

;; Taking corner points
(define (make-rect2 vertex1 vertex2)
  (cons vertex1 vertex2))

(define (rect2calc rect f)
  ;; Readabilty enhancement with let
  ;; I want to be able to understand it the next time I read it
  (let ((length (abs (- (x-point (car rect)) (x-point (cdr rect)))))
	(breadth (abs (- (y-point (car rect)) (y-point (cdr rect))))))
    (f length breadth)))
    
