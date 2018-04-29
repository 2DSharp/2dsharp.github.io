---
layout: post
title:  "The power of wishful thinking and abstractions"
date:   2018-04-29
excerpt_separator: <!--more-->
categories: SICP Programming
author: Dedipyaman Das
---

_"Wishful thinking, essential to good engineering, and certainly essential to a good computer science."_ - Gerald Jay Sussman

As new programmers are introduced to the world of programming, they are often lead into a world of tools called "programming languages" as the first step. While I do believe that the only way to learn how to program is by writing programs, the way one approaches the idea of programming greatly affects the way they are going to write software. 
<!--more-->
Let's face it, we all started with writing crappy code. More often then not, we realize what we wrote a week or a month back is just dead awful and that ugly mess has to be fixed immediately. You can see your own shortcomings in a week or so, that's the beauty of programming- you keep learning and improving all the time. But how do we build software in a way that we know is going to work, somehow, and you can fix your mess at a later point without affecting the rest of the code? 

**Introducing Wishful Thinking**

The idea isn't new, nor is it specific to computer science. It can be applied to any kind of engineering and it certainly works. To solve a big problem, you break it down to smaller pieces, smaller independent pieces. The bigger pieces should not know how the smaller pieces are built and how they work. All they need to know is if they input a certain type of value, they are going to get a certain kind of output based on the procedure they want to implement. This is called **Black box abstraction**. You have to abstract out the details of the primitive parts of the application and look on the bigger picture and sort of assume that you already have the declarative knowledge of the procedure you are working with.

Let's look at an example:
<br>You are asked to build a system which computes the square root of a given number and you decide to use the method given by Heron of Alexandria to approximate the square root of a number. This is how you do it:

1. 

Let's look at another example:

You are asked to build a procedure that computes the distance between two points on the xy-plane. 