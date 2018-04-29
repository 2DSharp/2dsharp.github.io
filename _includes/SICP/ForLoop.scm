;; Experimental Primitive For-loop implementation
;; Author- Dedipyaman Das (2d@twodee.me)
(define (for from predicate to next action)
  (if (predicate from to)
      (action from)
      #f)
  (for (next from) predicate to next action))
