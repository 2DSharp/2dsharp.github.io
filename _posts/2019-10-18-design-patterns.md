---
layout: post
title:  "Design patterns - to do or not to?"
date:   2019-10-19
excerpt_separator: <!--more-->
comments: true
categories: Experiences
description: "When are design patterns too much? How do I stop abusing them?"

author: Dedipyaman Das
---
When I came across design patterns a few years back, they seemed like a solution to everything. There wasn't a problem that one of the design patterns couldn't solve. It was almost analogous to mobile apps. _There's an app for everything these days_.

For those who don't know yet, design patterns are well defined patterns of reusable solutions that are followed to solve commonly recurring problems in the software engineering world.
<!--more-->

The term _design patterns_ surfaced from the legendary book by the **Gang of Four** (Erich Gamma, et al.) - [**Design Patterns**: Elements of Reusable Object-Oriented Software (1994)](https://en.wikipedia.org/wiki/Design_Patterns). More than 2 decades old, this book is still very much relevant in the fast-moving software industry.

Software Engineering being a young profession, we are struggling to find standard ways to do things. While we are trying to build something big, we end up adding dirty fixes and hacky features. No two engineers are same, and to achieve a common ground organizations enforce conventions and patterns to adhere to while individuals contribute.

My first encounter with design patterns was when I needed to establish a way to keep a particularly expensive database connection to just have a single instance to be accessed everywhere. That's when I came across the _Singleton_ pattern. 

I looked around for implementations of the Singleton pattern, and most examples I came across had a structure similar to this:

{% highlight java %}

public final class HeavyObject 
{
    private static final HeavyObject instance = null;
    private HeavyObject() {}

    public static HeavyObject getInstance() 
    {
    	if (instance == null)
    		instance = new HeavyObject();
        return instance;
    }
}
{% endhighlight %}

There are a few things to note here:

- The constructor is private. So, if you tried to instantiate it by calling: `new HeavyObject()` it wouldn't work. 
- The HeavyObject instance is a static property. Which means **global state**.
- You can only access it by calling `HeavyObject.getInstance()`, and it will return the same instance everytime.

_Perfect!_, I thought, as I replaced my current database connection with this, plus I enjoyed the lazy initialization goodness. It worked great and served my purpose. At some point, I was inclined to using it for almost every problem that I came across, or at least think about using it.

Turns out, global state isn't a particularly great idea. Global variables can wreak havoc if not used judiciously, and you may have tightly coupled pieces spilled everywhere in your project. 

**Enter _Dependency Injection_**: Trying to find ways to get around the Singleton pattern without using static, I found Dependency Injection (and the concept of Inversion of Control). In simple terms, you don't create the dependencies you need, you ask for it and someone hands it to you.

[Anthony Ferrara](https://twitter.com/ircmaxell), in his video presentation about DI explains it with the analogy of a house building robot. Your house building robot is programmed to take blocks of lumber and fit them together to build the walls. When it needs to build a doorway it has two options - To create each door out of raw materials, or to take a ready-made door and just add it to the house.

The door is a dependency for the robot to build the house. If it were to create a door everytime it had to add a doorway, and then in the future, you realized that you don't like the doors that the robot built - you'll have break that door, everywhere.

{% highlight java %}

public final class HouseBuilder 
{
    public HouseBuilder()
    {
    	this.block = new Block();
    	this.door = new Door();
    }

    public void buildHouse()
    {
    	makeWalls(block);
    	makeDoorWay(door);
    }
}
{% endhighlight %}

This class knows too much about how doors and how to build both blocks and doors. Don't let your classes know too much.

Dependency injection solves the problem by handing over a readymade door to the robot. Now if you'd like a different door, you simply swap the old door with a new door. 

This _decouples_ your wall from any specific implementation of the door. The robot just asks for a door that satisfies specific needs like the dimensions in the form of a _contract_.

Using dependency injection helps reduce tight coupling of code and enables us to switch between implementations of interfaces. This is inversion of control. The caller feeds the dependencies to the callee, rather than the callee creating its own dependencies.

So we can change it to something like this:

{% highlight java %}
public interface Door
{
	public void lock();
	public void open();
}
public final class HouseBuilder 
{
    public HouseBuilder(LumberBlock block, Door door)
    {
    	this.block = block;
    	this.door = door;
    }

    public void buildHouse()
    {
    	makeWalls(block);
    	makeDoorWay(door);
    }
}
{% endhighlight %}

Now that the door is an interface, we can switch out implementations in anyway we like. We may want a glass door at a store front and a wooden door in a house, and we can do that by simply injecting a different implementation.

Dependency Injection is often carried out by _Dependency Injection Contrainers (DIC)_ which create the dependency for you, usually utilizing _reflection_ to traverse multiple levels of dependencies. This is often useful for managing dependencies but not always necessary.

DICs can easily help you replace the `static`-based implementation of Singleton by asking the DIC to supply the same instance of the dependency. This easily reduces tight complexity and the evilness of singletons and global state. So this is how I ended up solving my _Heavy object Singleton problem_.

So far, we have established the advantage of writing to interfaces than to concrete implementations, we can also take advantage of another pattern called _Factory_ pattern. Dependency construction isn't always an one liner `new LumberBlock()`. Factories are methods that enable creation of dependencies with complex instantiation. 

This can be further extended by using the _Abstract Factory_ pattern that creates an object depending on the context.

For example, if you're making a store, you'd probably want to be supplied with glass doors. When you are creating a fort, you'd probably looking at strong iron gates. The abstract factory deduces that type of door to be supplied depending on the context. 

As it is evident from the discussion above, it's very easy to get lost in patterns while talking about them. You start off with some pattern and end up talking about something else.

Usage of design patterns has been growing gradually, and with that comes individuals abusing them to an extent that it exponentially deviates from the original intent. I've come across a lot of codebases that agressively use patterns and even anti-patterns like Singleton. 

The concept is tempting and as a consequence codebases turn into a huge mess of design patterns on every page. I am guilty of committing this mistake.

What I have learned from experience is to let design patterns surface based on a _need rather than a want_. Like on my first introduction to Singleton, I _needed_ a way to access just one instance of a database connection. 

When you start _wanting_ to use patterns for the sake of using patterns, that's when your codebase starts smelling and it ends up looking like:

{% highlight java %}

JSONDataStorageStrategy datastore = AbstractDependencyBuilderFactory.createSingleInstance("jsonDataStorage");

{% endhighlight %}

 It doesn't make any sense (not at least to me), and soon gets hard to decipher over time (I guess that's where Java gets its bad rap from).

Design Patterns isn't a silver bullet - they have their usecases, pros and pitfalls. They come with their own gotchas and they fit in some cases better than others. Just because your colleague used a facade over the data mapper doesn't mean that you'll have to. Many libraries actively incorporate some bad design techniques this way.

For example, _Active Record_ is often considered an anti-pattern is being used at many popular ORM-libraries with big corporations backing them. 

Anyhow, design patterns can be a great thing if used judiciously. Deciding on a use-case and trying out a simpler solution first should be done before jumping onto the GoF book. This can yield great results and improve the codebase signficantly.

Recently, I came across the _Notification Pattern_ from [Martin Fowler](https://martinfowler.com)'s _Further Enterprise Application Architecture development_. This turned out to be a great alternative to my previous exception-based validation approach by saving me some computational cost and allowing me to aggregate all the errors at once.

With that said, we invent new patterns everyday and sometimes they add additional complexity to our codebase. One good rule of thumb while writing code is to make them reusable and do just one thing. 

One of the best strategies I have devised is to make a very local solution to a local problem first, and then generify it along the way.

The entire goal of design patterns is reusability, and they may have consequences and tradeoffs that come along with them which we have to deal with. 

Questioning whether if its really worth the additional complexity and designing a mitigation strategy for dealing with the tradeoffs beforehand will take you a long way than simply using a pattern just because someone else is. 

_You ain't gonna need it._
