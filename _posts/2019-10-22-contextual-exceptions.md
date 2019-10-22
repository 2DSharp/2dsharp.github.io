---
layout: post
title:  "Contextual exceptions"
date:   2019-10-22
excerpt_separator: <!--more-->
comments: true
image: assets/blog/exception.png
categories: Opinions
description: "Exceptions are often misunderstood and misused in development. They often have a cost added to them as we continue to implement them and correctly utilizing them is the developers responsibility from day 1."

author: Dedipyaman Das
---
Exceptions are beautiful programming constructs that are often misunderstood. They can allow you to effectively deal with cases where your application may fail AND provide a way to recover from it. Although, many don't seem to understand why and when to really use them. 

Some end up overusing them to an extent that it gets difficult to understand the intent of the program and some (under/ab)use them in all sorts of ways I can't imagine.
<!--more-->

One of the worst ways to deal with exceptions is to simply print the stack trace. Java provides you an easy way to do that with `e.printStackTrace()`. It's great for debugging in development, but in production? A complete no-no. Unfortunately, I have seen enough code in my life to believe that people do have the habit of pushing that to production.

Another school of thought is that exceptions are evil and people downright try to avoid them. Yes, they do provide another exit point for our application to use, but that's only for _exceptional circumstances_. That means, it's going to be a rarity, and you should be able to gracefully recover from it without ruining the user experience.

If your application runs into exceptions just as much as a valid flow, you're not using exceptions correctly, but that discussion is for another day. I am not going to talk about whether exceptions are good or bad and how they are useful or not.

What I really want to talk about is exceptions within contexts. 

A common way to handle exceptions is to just rethrow them till the final caller ends up handling it. So when registering a new user, your data mapper throws an exception on persistence:

{% highlight java %}
DataMapper.persist(Object object) throws PersistenceException
{% endhighlight %}

And how is it handled?

{% highlight java %}
class UserRepository
{
	public void save(User user) throws PersistenceException
	{
		...
		dataMapper.persist(user);
	}
}
{% endhighlight %}

Now when we go higher on the domain layer, we expose the same exception to the caller - the `AccountService`. 

{% highlight java %}
class AccountService
{
	public void registerNewUser(User user, MetaData data)
	{
		try {
			...
			repository.save(user);
		} catch(PersistenceException e) {
			// do something with the exception
		}
	}
}
{% endhighlight %}

So your service now has to handle the `PersistenceException` thrown by the `DataMapper`. 

Wait, do you see what happened there? You just exposed your implementation details to `AccountService` - which is two levels higher than the data mapper. 

The point of abstraction is completely missed at this point. While you were trying to abstract things away using a repository in your service layer which in turn talks to a data mapper, you leaked an implementation detail embedded in your method signature quite explictly.

How should the service layer deal with a implementation specific exception? Fear not, we can do worse.

We can rethrow that and go one layer higher - maybe in a Model-View-Controller design - the call to the Service Layer is made from the controller's context, so now the controller now has to handle the exception. 

_Inversion of Control, right?_

At this point the controller has no idea why its being handed a persistence exception. If it's still hard for you empathize with the controller, let the controller rethrow it! Now where does the exception end up? The top level caller - the end user.

The end user now sees a massive stack-trace:

```
javax.persistence.PersistenceException: Unable to build entity manager factory
at org.hibernate.jpa.HibernatePersistenceProvider.createEntityManagerFactory(HibernatePersistenceProvider.java:81)
at org.hibernate.ejb.HibernatePersistence.createEntityManagerFactory(HibernatePersistence.java:54)
at javax.persistence.Persistence.createEntityManagerFactory(Persistence.java:55)
at javax.persistence.Persistence.createEntityManagerFactory(Persistence.java:39)
at com.uzh.platform.api.util.AssignmentUtil.findAll(AssignmentUtil.java:20)
at com.uzh.platform.api.services.GetAssignments.getAssignments(GetAssignments.java:22)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:606)
at org.glassfish.jersey.server.model.internal.ResourceMethodInvocationHandlerFactory$1.invoke(ResourceMethodInvocationHandlerFactory.java:81)
at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher$1.run(AbstractJavaResourceMethodDispatcher.java:151)
at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.invoke(AbstractJavaResourceMethodDispatcher.java:171)
...
```

Maybe you have been printing the stack trace all your life and aren't intimidated by it when you see it. But think about it from your layman user's perspective. Does it make any sense to the poor user at all? 

No. They would panic and call customer support immediately, and you know what they'd do? They would send you a picture of the stack trace clicked on their phones. Which at this point, is essentially _rethrowing_ the exception back to YOU. Only this time, your money is on the line.

Now, it's your turn to ask them what really happened and what they clicked and how this came about. You try to _understand the context_ and fix the issue.

If you have been developing software for more than a year, you'll know that when you go higher the abstraction level - the more vague the cause of the problem becomes. Most end users are not going to be of much help unless you have a lot of well paid and patient support representatives.

It could have been avoided by simply saying something sensible like: "Something went wrong in our servers! We are fixing it ASAP." to the user.

This would make perfect sense to your customers, and in most cases they'd simply wait till it gets fixed. It's understandable in their _context_.  

I take this opportunity to coin the term **"Contextual Exception"**. 

The idea is to wrap implementation specific exceptions thrown by low level parts of the code to domain specific exceptions that fits the context from which the method was called till the point that it stops being an exceptional case for the caller in the context. 

This can later be handled sensibly at a higher level of abstraction to deliver a useful feedback to the caller and continue.

So the `PersistenceException` thrown by the data mapper in our first example, can be handled by the UserRepository itself, which can then find the root cause of the exception and handle it appropriately. The UserRepository understands what could have happened in the data mapper layer and can deal with it.

For example, in JPA, a foreign key constraint violation throws a `PersistenceException` as well. You can catch that in your repository and wrap it in a (domain specific) `UserExists` exception, which makes perfect sense to the `AccountService`. Now, when registering an account, a non-unique email address may be entered. This is expected by your controller.

But even though you check for uniqueness before hand with a `select` query, there may be some race conditions when you may end up entering a value which becomes non-unique. Like two users simultaneously trying to register with the same email address. One of them will register first and your check at the beginning will fail.

The only way for JPA to tell you that such an exception occurred is by throwing an exception at a low level. In such a case, your repository has to graciously recover from that and wrap it into something meaningful to the upper layer - that is the account service.

Then what about the exception to be thrown to the controller? In most cases, you shouldn't throw an exception back to the controller. You should handle it right there in the service layer and casually let the controller know that the email address has already been taken.

_Why?_ Because this is not really an exceptional case for the controller. The controller expects users to enter non-unique email addresses and usernames. It has no idea about the persistence layer or any of the implementation details which may raise race conditions.

The account service may use some sort of notification system to convey the message to the controller and the controller can turn it into a user friendly representation or just pass it to the view to do that. Now the account service can look like this:

{% highlight java %}
class AccountService
{
	public void registerNewUser(User user, MetaData data, Notification note)
	{
		try {
			...
			repository.save(user);
		} catch(UserExists e) {
			...
			note.put("email", "The email has already been taken");
		}
	}
}

class Controller
{
	public void registration(Request request)
	{
		...
		accountService.registerNewUser(user, meta, note);
		if (!note.isEmpty()) {
			// do something useful
		}
	}
}
{% endhighlight %}

One thing to note is that exceptions can be costly, especially while catching and unwraping them. That's one reason why people call them evil. But exceptions are there for a good reason - To deal with exceptional cases, and such cases shouldn't happen in your normal flow of operations, at least in that context. 

A user entering non-unique email addresses is not exceptional to the controller, but a sudden connection loss with the account service on a network is very much an exceptional situation. 

In that context, the appropriate party should raise an exception and this should be handled by the controller in a graceful way while logging the cause for debugging.

Yes, there are some cases where rethrowing the exceptions and letting them bubble up is the best option but that's usually when that's your _only_ option. Again, it largely depends on the context and how your system is built.

If you are going to (re)throw exceptions, ask yourself this - does it make sense for the one receiving the exception? In most cases, your answer would be "no". 

Handle exceptions with care.