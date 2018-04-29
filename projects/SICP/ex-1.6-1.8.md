---
layout: post-code
title:  "SICP- Exercises 1.6 to 1.8 solutions"
canonical: "Exercise 1.06 to 1.08"
excerpt_separator: <!--more-->
categories: SICP
exclude: true
index: true
iterator: sicp-sol
author: Dedipyaman Das
---	    

# Solutions: If evaluation and square roots by Newton's Method:

**Exercise 1.6** 

Alyssa P. Hacker decides to make a new version of `if` in terms of `cond` as a procedure. The `new-if` seems to work for basic cases as shown by Eva,  and Alyssa decides to rewrite the square-root program with `new-if`

{% highlight scheme %}
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))
{% endhighlight %}

Here is the square root procedure:

{% highlight scheme %}
{% include SICP/SqrtApprox.scm %}
{% endhighlight %}

Implementing Alyssa's version of `if`, the `new-if` in `sqrt-iter`: 

{% highlight scheme %}
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                      x)))
{% endhighlight %}

When Alyssa attempts to run it, since Scheme uses **Applicative order evaluation**, the interpreter will try to evaluate `sqrt-iter` in a never ending loop because of the nature of evaluating procedures in applicative order. 

What she didn't realize is that `if` **is not a procedure**. It is a **special form** which doesn't act as a procedure underneath, and its conditions are checked first and then the clauses are implemented. Hence, `new-if` won't work the way `if` would.

**Exercise 1.7: Improving square root approximation**

The `new-sqrt` procedure that I mentioned above doesn't starts failing at very large numbers, the break-point I found in my computer (with some manual binary search) was: _17738094999817_, trying any number larger than that would not work as intended. This test was also true for very small numbers (having too many zeroes after the decimal point).

The alternative checks for the change of `guess`. If the difference of the guess and the new guess is small enough, we can consider it a good-enough guess. This is the implementation:

{% highlight scheme %}
{% include SICP/Exercises/Chapter_1/1.07.SqrtApprox2.scm %}
{% endhighlight %}

This seems to work perfectly fine for very large and small numbers and it easily passes the break point. Hence, we have an improvement in our `sqrt` procedure.

**Exercise 1.8: Cube root procedure**

A rather simple exercise that asks us to implement a `cube-root` procedure analogous to our new `sqrt` procedure, this is based on Newton's method for cube roots to approximate the values:

{% highlight scheme %}
{% include SICP/Exercises/Chapter_1/1.08.CubeRootApprox.scm %}
{% endhighlight %}

This program works well enough to calculate cube roots. No further comments.

_Dedipyaman_