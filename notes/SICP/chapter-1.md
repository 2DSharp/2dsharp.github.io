---
layout: post
title:  "SICP- Chapter 1"
excerpt_separator: <!--more-->
categories: SICP
exclude: true
---	    

# Solutions to Problems:

**1.1.** The first exercise is fairly simple, I am not writing the answers to it.

**1.2.
Translation from infix to prefix notation:**
{% highlight scheme %}
(/ (+ 5 4
      (- 2 (- 3 (+ 6 (/ 4 3)))))
   (* 3
      (- 6 2)
      (- 2 8)))
{% endhighlight %}


**1.3. A procedure that takes 3 numbers as arguments and returns the sum**

So, I had to break this problem to two sub problems:
	
* Finding the smallest of the three numbers given.
* Finding the sum of squares (which had a trivial subproblem of defining what the square of a number was).
	
At the begining I went all out with `cond`s populating the entire implementation to check if some number was equal to the smallest number I found and then sum of square the other two. This was a childish approach but it worked. But then, it looked ugly, so I tried looking it up online and found a better solution - although it will do one or 2 more squares, it is still a more flexible solution- square all the three arguments, negate the square of the least. Made perfect sense!
{% highlight scheme %}

(define (largest-sos x y z)
  ;; Sub-procedural definitions
  (define (smallest-of-three x y z)
    (cond ((and (< x y) (< x z)) x)
	  ((and (< y x) (< y z)) y)
	  (else z)))
  (define (square a)
    (* a a))
  (define (sum-of-squares a b)
    (+ (square a) (square b)))
  ;; Implementation
  (- (+ (square x)
	(square y)
	(square z))
     (square (smallest-of-three x y z))))
{% endhighlight %}

**1.4. Behavior of the procedure:**
{% highlight scheme %}
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
{% endhighlight %}

This procedure simply does what it says, it adds two numbers a and absolute value of b. The internals of it work like-

_If b is positive, evaluate: `(+ a b)`. Otherwise, evaluate: `(- a b)`_.
Hence, whatever be the case, the value of a and absolute value of b are added resulting in an equivalent expression: `(+ a (abs b))`

**1.5. Difference in Applicative order and Normal order evaluation**

This is a rather interesting problem, and I went the other way around the first time. The key to the answer is in the idea of Normal Order Evaluation- _To not evaluate the operands until their values are needed_. In Applicative order, the sequence is a series of _"Apply then Eval"_, whereas in Normal order, we expand the procedure fully till we have just the combination of primitive elements and then reduce that to find the result. The difference is not trivial.

As in **Applicative order**, the evaluation process will be:

* Substitute the formal parameters with the given arguments.
* Apply the operator to the operands and evaluate them.

Now, this will attempt to evalutate `(p)` which will result to itself, i.e., `(p)`. Thus, we have a recurring procedure that calls itself again and again and the process will never terminate by itself. Thus we will never get an output from this procedure with Applicative order eval.

In **Normal order**, the interpreter will expand the entire procedure to the primitive elements, hence we will have something like this:
{% highlight scheme %}
(if (= x 0) ;; Returns true
    0 ;; <-- Result
    (p)) ;; Will NOT be evaluated just yet
{% endhighlight %}

`(if (= x 0))` will return true with the given input and since normal order ignores the arguments unless they are really needed, it will never be evaluated. 

Hence, we will get an output of 0 on Normal order eval.

_Dedipyaman_

[jekyll-web]: https://jekyllrb.com
