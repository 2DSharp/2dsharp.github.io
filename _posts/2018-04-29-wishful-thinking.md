---
layout: post
title:  "The power of wishful thinking"
date:   2018-04-29
excerpt_separator: <!--more-->
categories: Programming Clean-Code
description: Wishful thinking, a neat technique can help reduce complexity. Find out how!
image: assets/profile.jpg
author: Dedipyaman Das
---

As new programmers are introduced to the world of programming, they are often lead into a world of tools called "programming languages" as the first step. While I do believe that the only way to learn how to program is by writing programs, the way one approaches the idea of programming greatly affects the way they are going to write software. 
<!--more-->

Let's face it, we all started with writing crappy code. More often then not, we realize what we wrote a week or a month back is just dead awful and that ugly mess has to be fixed immediately. You can see your own shortcomings in a week or so, that's the beauty of programming- you keep learning and improving all the time. But how do we build software in a way that we know is going to work, somehow, and you can fix your mess at a later point without affecting the rest of the code? 

### Introducing: Wishful Thinking

>"Wishful thinking, essential to good engineering, and certainly essential to a good computer science." - Gerald Jay Sussman

The idea isn't new, nor is it specific to computer science. It can be applied to any kind of engineering and it certainly works. It's a process of thinking in layers, and submitting to a belief or idea on how the system should work by gluing the pieces together which you expect to be already be in place for you to work with.

In a scenario where you need to build a very complex system, you have two ways of going about it:

#### The top down approach

With this approach you prepare a mental image of the solution to the problem statement given. You start considering the end product and how that should behave and how the model should look like by **assuming** that the pieces you need to build the system are already there. You don't care about the intricate details of how a system is built. You work in high levels of abstraction.

Take for example: C, the programming language.
You write some C code similar to this:

{% highlight c %}

#include <stdio.h>
int main()
{
  printf("Hello, World!");
  return 0;
}
{% endhighlight %}

Very simple program, isn't it? Well then again your computer doesn't understand English so that's going to be compiled into machine code consisting of just binary values that your computer can understand. That's just a piece of machinery. It doesn't really even understand those weird hex numbers, it understands binary digits converted to electrical signals.

But then again, do you really care about how the machine works while you simply want to output "Hello, world"? You take it for granted that the compiler will do it's work and the computer will somehow magically understand what you are trying to tell it, in plain english.

You _assume_ that a system is already in place which will take care of translating your thoughts to machine language so your computer will respond accordingly. Now, since you don't need to care about the details, you can work on the bigger problems, like making that banking software or scraping that website.

Now, when it comes to debugging to a much deeper level, when you need a dump of assembly code or machine code, that's when you care about how it works. You might want to optimize something that the compiler couldn't (trust your compiler), you go deeper into the system and fix it. You go from a higher level of abstraction, to a lower level. You go from the top to the bottom, closer to the machine.

#### The bottom up approach

The bottom up approach is just the opposite. You worry about the details first, you fix everything from bits and bytes and go upwards. The visualization of the system gets tougher in this scenario. You worry about the machine code before you go about building the software that you really were asked to develop.

**Which one's easier?**

In most cases, the answer would be the top down approach. You visualize the system, and then you work through the details and figure out how to glue things together.

To solve a big problem, you break it down to smaller pieces, smaller independent pieces. The bigger pieces should not know how the smaller pieces are built and how they work. All they need to know is if they input a certain type of value, they are going to get a certain kind of output based on the procedure they want to implement. 

This is called **Black box abstraction**. 

You have to abstract out the details of the primitive parts of the application and look on the bigger picture and sort of assume that you already have the declarative knowledge of the procedure you are working with.

You prepare a contract with the pieces that you need to work with. You simply say: "If I input a value of X into the box, I should get Y as the output. I don't care how you do it, I just want you to do it based on these terms."

#### Consider this scenario:

You have to build a system, similar to a lego building. Your building has to be built with boxes. Each box has it's own unique feature. For example: volume, mass etc.

Now to complete the building, you need to glue the boxes together, in a way that they fit perfectly. So, you prepare out a plan on how to place the boxes and where to place them. You develop a contract, and start making boxes or leasing boxes. You don't care how you get the boxes, you just know how to fit them together.

Now, the advantage of this is, you can outsource this task to someone else, maybe your colleague John, who is very good at building a system that gets Y from X. Now your code isn't tightly bound to the details inside the boxes. 

You have created a space in your system where you can fit in any 2x2x2 cube. You don't care what's inside the box. Now if your friend, Alice, comes up with a better solution than your colleague, you can simply swap the boxes. 

This is called loose coupling. You can fit in any box in the space in your system provided that it fits your requirements. Once you have a clear idea about how the box can interact with your system, you might want to go into the details of the box and figure out how the boxes inside the box fit together.

This is the idea behind the `interface` keyword used in Java. You prepare a set of contracts that the "objects" need to conform to. This allows de-coupling between the objects. This is the idea behind the **I** in the **SOLID** principle, that is, the **Interface Segregation principle**. Now, if something goes wrong in a single piece of your system, you simply swap out that piece and put in a piece that works without effecting the rest of your code.

Now, when you are about to build a big, complex system to the likes of Facebook or Youtube- this is how you do it:

- You imagine a high level view of how your model should look like.
- Break your system down to smaller pieces that can be glued together to make your system work
- Design the contracts for the pieces without caring about the implementation details.
- Get the pieces and glue them together.

This ensures your system can be expanded indefinitely as your business requires you to do and improve the sub parts of the system without having to change anything else than the specific piece you want to fix.

_Dedipyaman_