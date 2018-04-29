
(define dx 0.0001)
(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? guess new-guess tolerance)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (if (close-enough? guess new-guess tolerance)
	new-guess
	(fixed-point f new-guess))))

(define (newtons-method  function x)
  (lambda (x) (/ (function x) ((deriv function) x))))

(define (deriv function)
  (lambda (x)
    (/(- (function (+ x dx)) (function x)) dx)))

(define (sqrt x) 
  (newtons-method (lambda (guess) (- (square guess) x)) 1.0))
