;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.12
;; A more practical approach for engineers
;; Intervals with percentages
(load "2.10.DivIntervalMod.scm")
(define (make-center-width center width)
  (make-interval (- center width) (+ center width)))
(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))
(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define (make-center-percent center percentage)
  (make-center-width center (* (/ percentage 100.0) center)))
(define (percent interval)
  (* (/ (width interval) (center interval)) 100.0))
