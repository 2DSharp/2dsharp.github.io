(define dx 0.0001)
(define tolerance 0.00001)

(define (fixed-point f guess)
  (define (close-enough? guess new-guess tolerance)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (if (close-enough? guess new-guess tolerance)
	new-guess
	(fixed-point f new-guess))))

(define (newtons-method f guess)
  (define (newtons-transform g)
    (lambda (x)
      (- x (/ (g x) (deriv g) x))))
  (define (deriv g)
    (lambda (x)
      (/ (- (g (+ x dx)) (g x))
	 dx)))
  (fixed-point (newtons-transform f) guess))

(define (cubic a b c)
  (define (cube x) (* x x x))
  (lambda (guess) (+ (cube guess)
		     (* a (square guess))
		     (* b guess)
		     c)))
			
