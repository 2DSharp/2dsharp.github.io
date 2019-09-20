(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter val counter)
    (if (> counter n)
	val
	(repeated-iter (lambda (x)
			 (f x)) (+ counter 1)))))
      
