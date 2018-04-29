;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.1
;; Normalizing the output of make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((numer (/ n g)) ;; Doesn't look pretty
	  (denom (/ d g)))
      (cond ((and (< numer 0) (< denom 0))
	     (cons (abs numer) (abs denom)))
	    ((or (< numer 0) (< denom 0))
	     (cons numer (abs denom)))
	    (else (cons numer denom))))))
(define numer car)
(define denom cdr)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
