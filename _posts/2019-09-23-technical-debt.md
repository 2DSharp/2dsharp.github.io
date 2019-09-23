---
layout: post
title:  "Technical debt"
date:   2019-09-23
excerpt_separator: <!--more-->
comments: true
image: assets/blog/debt.jpg
categories: Clean-Code
description: "Technical debt is inevitable in Software Development. The debt piles up over time to send you into a non-scalable hell of code smell. How do we minimize them?"

author: Dedipyaman Das
---

Software development is cursed with an implied cost at any stage, no matter how elegant your solution looks at any point of time. The cost of fixing what you messed up. Humans write code, and code is prone to ugliness. This piles up over time and dealing with it is a challenge every team faces many times in their lifetime.
<!--more-->

While building any sensible system with code filling more than a page you start breaking things down to pieces, if you aren't you should. When you start abstracting things away into separate smaller modules, you start thinking about how to put them together. Oftentimes, you need to add one tiny feature and then one more, while trying to keep the initial structure you had in mind intact.

Although the idea was clear at the beginning, the pieces don't simply fit together as easily as you'd want them to be. So, you mess around the structure of the codebase a bit, just fine little harmless tweaks. As features accumulate, you start to see a big change that module's structure.

What starts off as a clean, well-structured module now became this horrible mess of hacky additions of features. At some point, you stop understanding what it was supposed to do, because it's doing too many things.

_But it works._

So you leave it behind, put a checkbox in your TO-DO list and move on with the next module. Then days after, your requirements change and you need to modify that module once again. Or maybe you'd like to integrate it with some other module. The confusing module is now hard to read, understand and extend. Moving any further would be an impossible task with it.

You've two choices at this point- 
- Discard it entirely and start fresh
- Fix it

Unless you're building your first application which doesn't do much, the first is usually not the best option. Especially in a project where you put significant amount of time thinking about and developing that module. It works, and it has some clever crafted code inside it, it's just turned messy.

Now you have to take a step and fix it.

This is **Technical Debt**. As in monetary debt, if you don't repay your dues early on, the interests will accumulate and push you into a hard-to-return-from point.

When you thought, _"hey, this works for now, we can fix that later"_ you fell a little deeper into the debt trap. Technical debt is the additional cost you implicitly added to your project by choosing an easier path that you will have to pay for in the future.

Now what would have taken you 3 days of work, will take you about a week. It's the cost of fixing the code (paying off the debt) + the cost of implementing the new feature.

### How do I prevent technical debt?

You don't. You can only minimize it. Think of it as a financial system, and do exactly what you'd do when you loan money off your bank. You pay the dues gradually. Once you are done implementing the first feature in your module, you take some extra time to remove that mess and make it saner.

Yes, you did put extra time into it, but it lessened the burden for the next feature and decreased the overall cost. This gradual removal of mess enables you to fix the parts of your code that needs the most modifications over time, and hence needs to be the cleanest.

Cleaning it off gradually over time will make sure the debt doesn't accumulate to the point of no return over time. And it helps you keep the internal code quality fresh at the points where you need it the most.

Recently, in a system I had used a factory to convert transfer objects to domain entities. It was initially meant to do just that, but I ended up validating the data and checking for redundancy from the persistence layer inside it. All within a factory. It was too smart at that point.

Eventually I kept using this factory in too many pieces, and adding more logic to make it smarter. I started having a hard time connecting the pieces together and that was a clear violation of **SRP**. I had to take a day off just to dumb the factory down to just be limited to creating the objects and not do too much.

**Tight coupling** is a major evil in a modular system and can often lead to code smell even in the most initially well thought out business logic. Coupling can end up contributing to the technical debt you accumulate over time, and you simply would be confused when something stops working in the cleaning up process.

When you start paying off the dues at a much later stage in a tightly coupled system, you find yourself breaking things even more than you'd do normally. At that point the paying off process becomes a nightmare and takes huge effort to fix.

**Unpopular opinion:** Don't fix something that works and you seldom change.

If your co-worker built a module that works perfectly fine and integrates just well enough for you to go on with - don't bother about fixing it if you don't modify it frequently enough. There's little reason to fix something that confusing and doesn't need fiddling with. If it meets your business requirements, leave it alone.

Finally, **write more tests**. Sometimes, we just need to add a quick fix, inject a hacky piece of code to make something work or to slightly change its behavior. What we don't see at the first glance are the side effects. We tend to look more at whether that quick fix solved the actual problem, and we miss out the side effects it brought along with it. Tests help out with that, you get instant feedback.

That's why I am an advocate of Test Driven Development. It gets you to move those sticky pieces long before you even are done implementing a feature, and hence reduce the cost. A slight cost added is the cost of writing those tests, but you would have to write them anyway.

Technical debt is inevitable in software development, and it will come around. And sometimes we need to trade off elegance for making things work, that being said, paying them off sooner will make your life a lot easier.