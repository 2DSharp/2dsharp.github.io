---
layout: post
title:  "Learn Programming The Right Way"
date:   2018-11-27
excerpt_separator: <!--more-->
comments: true
image: assets/profile.jpg
redirect_from: 
    - /blog/programming/beginners/2018/11/27/get-started-with-programming
categories: Programming Beginners
description: How do you start programming? Here's my take on the subject and how to start preparing yourself to teach yourself programming
author: Dedipyaman Das
---

A recent train journey inspired this blog post. As promised, albeit being late, this is the blog post on how to start programming if you are a complete beginner.

This is a continuation of my post: [Learn Programming in 24 Hours!](https://www.twodee.me/blog/2018/08/06/learn-programming-in-24-hours)
<!--more-->

Now here are a few gotchas about this post- 
  - I do not claim to be an expert in the field.
  - It is not a silver bullet or a magical todo list to take you from zero to hero in less than X time.
  - This is not a tutorial of any kind. This post just gives a few pointers to the absolute beginner so that they can get started a bit more easily.
  - This post doesn't guarantee success. This is a compilation of my experience.


# Find your motivation 

So when I wrote my first line of code back in 2010, I was a 10-year-old sixth-grader. I was impressed with the game Smackdown Vs Raw 2010 by WWE and THQ, especially the "Create a Wrestler" feature - which allowed players to create a fictional superstar with appearance, attributes, and moves of their liking. I wished that feature to be available in other games as well and was curious about how it was done.

I wanted my own storyline and characters.

So, I decided to figure it out. I grabbed my old laptop, googled "How do I make a video game?" and started hunting down ways to start making a game and ended up finding a tool called Game Maker which would allow you to create tiny little 2D video games. That was my introduction to game building. That was a good stepping stone, but I still didn't know how to make a game with an actual storyline.

I wanted control. I read more and more and found out that games need to be "programmed". I envisioned a GTA-like open-world game with my own characters, storyline and weapons. And to do that I had to learn how to program.

Enter QBASIC - my first programming language. This was being taught in my class, but I never cared for it before. Now I did. Because it meant something to me now. This is a tool I can move forward with.

I started with the infamous "Hello world" program and moved on to write programs emulating a simple Quiz Game with menus and everything on the Command Line.

This led me to stick in and never move away from this craft. I haven't build a game yet, but I have moved in different directions and I am grateful to my 10 year old self for that. 

**So here's the bottomline:**

If you don't care about programming, you are never going to learn to program. Programming itself isn't fun. Finding ways to solve a problem is fun. It's the same thing as solving puzzles. No one likes adding numbers, yet people like solving Sudoku puzzles. It's a challenge you set up for yourself. Numbers and addition is just the tool to solve that.

So find yourself a problem, a motivation if you will - and start figuring out ways to solve it. One step at a time. You aren't going to build a microservice application in one day. Start with smaller ones, make mistakes, learn from them and make a bigger one the next time.


# Stop reading! Start writing iteratively, learn from your experience

As wrong that may sound, you learn to program when you program. It's a recursive process. I have tried sitting in front of a video tutorial or reading books for hours to end up forgetting in a week or so. Reading is practically useless if you are not using it.

I learn more when I write, and you should too. People call it practice. When you start writing code and compile and see it run - you are in debug mode. You try to find the flaws in your program rather than trying to remember what you did. Your brain saves that information for you.

This is how it roughly works. Imagine learning to program for the first time in C.
Here's your first piece of code that your remember seeing on a tutorial:

{% highlight c %}

int main() {
    printf("Hello, world!");
}
{% endhighlight %}

You compile it and you are presented with this:

```
hello.c: In function ‘main’:
hello.c:2:3: warning: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
   printf("Hello, world!");
   ^~~~~~
hello.c:2:3: warning: incompatible implicit declaration of built-in function ‘printf’
hello.c:2:3: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
```

Woah, to a beginner that's probably very intimidating. But, if you can read english, it's not too hard to decipher. 
Our brain just likes skipping over things. 

What it really says is:

In function "main", printf has been implicitly declared. The compiler doesn't know where printf is defined. So, it's asking you to either create a function called printf and try compiling it again OR include `<stdio.h>`.

Then you recall: _Hey, I think I read about that stdio thing, maybe just include it?_ 

You google: "How do I include <stdio.h> in a C program?". Some angel on Stackoverflow or some similar thread has already answered this question. And you weren't the first one to come across this!

Then you add this line: `#include <stdio.h>` to your program. It looks somewhat like this:


{% highlight c %}
#include <stdio.h>

int main() {
    printf("Hello, world!");
}
{% endhighlight %}

It compiles successfully and you run `./a.out` and it works! Almost...

```
username@pc: gcc hello.c
username@pc: ./a.out
Hello, world!username@pc
```

Well, we didn't want to print the `username@pc` on the same line, did we? What could we be missing?

It turns out, your code simply printed the text and the prompt of your shell decided to continue from that line. We need a way to print `<RETURN>` or a new line so that the cursor goes to the next line.

After some research on how to move the cursor to the next line in C, you add the "\n" character to the end of the print statement.

{% highlight c %}
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
}
{% endhighlight %}

And you compile it once again, no errors. And you get the output:

```
username@pc: ./a.out
Hello, world!
username@pc:
```

It finally works. Your brain remembered and stored it in your "Experiences" folder. Now when you write a similar program next week, you'll immediately recall that you need to include `<stdio.h>` and add that `\n` character.

Remembering pieces of relatable experiences and failures is easier than remembering this chunk of code:

{% highlight c %}
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
}
{% endhighlight %}

Try it out, it will almost certainly make a huge difference.

# Add development tools to your arsenal and make life easier

While people generally recommend you to use nothing but a simple text editor at the beginning of your programming journey, however software development is never about just one page written in one language that's compiled by one compiler or interpreter. 

Get to know your tools and use them effectively. One absolute improvement in any project is the addition of version control. Pick one, git is a popular choice.

Choose a proper text editor/IDE that integrates well with your programming environment. What works for me shouldn't necessarily work for you. What works for Java shouldn't necessarily be great for C++. 

I personally prefer Emacs as my default text editor to  edit configuration, write scripts, and C applications. Because of it being lightweight, fast and powerful I am more productive with it while writing command line apps.

For heavyweight applications, like the ones written in Java, I prefer IntelliJ IDEA - one of the best IDEs out there. Due to Java's verbosity, it's often common to miss out a lot of things. IntelliJ is smart enough to keep recommending improvements and finding issues with your code even before you hit compile. It integrates well with Java build, testing and dependency management tools and makes java development a cakewalk.

Then come the build tools. Choose a popularly supported build tool for your language and use that. You don't want to manually compile every file to turn them into one final executable. Let your build tool automate and take care of that. 

Get a proper dependency management tool as well. Oftentimes build tools come with built in dependency management.

As you move forward you'll come across tools to unit test your application, find code coverage, add integration testing to it. All of these add to your skillset and help you write better software over time. If you don't want your code to misbehave, you need ways to build and test them properly before you give it out to your clients.

# Listen to your tools

As with the last example, the way we solved the problem was by reading the error message and understanding what it meant and acting on it. What most beginners miss out on is reading error messages. 

Almost every newbie who comes up to me with an issue with their code says that they are getting _"an error"_ in their code. When I ask them what the error is, they are either blank or can't recall what it actually meant. It's understandable, error messages from compilers aren't always user friendly, and a lot of experienced developers face this problem too. But in most cases, at least in the beginning stages, the compilers would throw in enough pointers for you to figure out what you are doing wrong.

You just need to know where to look. And that comes with experience. Compilers often print a (un)helpful message along with line numbers and function names to enable you to debug the code. One way to go about it is to read the error message line by line and interpret what that means. The language is often not aimed towards beginners, so you'll probably need to consult a thesaurus or a dictionary if English isn't your first language.

Once you have interpreted the error into a simpler version, try finding those line numbers and function names where your compiler/interpreter is pointing you to. 

Then, start discarding the information you don't need. Java often produces a stack trace with a lot of lines describing all the classes where the function was called and declared from. Discard the error messages which originated from the library or function that you didn't write and ask yourself:

_"What did I write that caused this problem in the other library that I didn't write?"_

Then read the filtered error message once again, and you'll start having an idea on how to go about solving the issue. If you've been scratching your head for too long, then you may go ahead and google that filtered error message. Chances are, someone already had that issue.

Being able to read error messages and interpreting its meaning is as important as being able to expressing your thoughts in your code.

Your code is you trying to tell the computer what to do. The error message is what the computer telling you that it can't do what you asked it to do, because you did something wrong or it doesn't understand how to do it. This more you improve working with this feedback mechanism, the better you get.

You need to be able to talk to your computer very clearly to be able to write applications that solve your problem. 

**Programming is a two way communication.**


# Write programs, a lot of them!

Not writing code is by far one of the biggest problem with students I have met in my university life. Students learn a new language, the grammar and the semantics and just move on with the next cool thing they find without actually trying to stick with one thing and making something useful. They put it in their resume and move on with their lives.

The only way to get better at writing programs, is to write more programs that solve different kinds of problems. Doing the same thing over and over again isn't going to make much of a difference. You need to find new challenges and solve them every day. One good way to keep track of it is using Github contributions. Looking at the green boxes will help you understand if you are actually improving or not.

The greener your page is, the more you have been improving. If it's been greying out, this is your wake up call. Yes, there are days when you don't feel like it. And it's fine to take a break every once in a while.

On average, I write and delete about 150-300 lines of meaningful code everyd ay. When I say meaningful, it means that the code actually does something useful and not just for the sake of keeping my Github profile green.

**If there's one thing that you can to pick from this list, this is the one.**

Make projects! Stop watching those video tutorials about that fancy new technology. Make something first and keep improving on it.

I have come across individuals who have been "course hopping" from one course to another. One minute they learn python, the other minute they learn Android. And I am yet to see anything useful come out of them. Don't be a course hopper. If you can't commit to a particular online course (I can't, I am too impatient), just work on a project.

If you want to stick to reading about technologies and how they work and not implement them and see them actually work - maybe engineering isn't for you. You can stick to academia instead. And there's nothing wrong in that. Not everyone in the computer science community needs to be a great programmer. It's just a subset.

_Experience is a bigger teacher than training._

**_Dedipyaman_**