# Queue

## What is a queue?

You're probably most familiar with the concept of a queue from your real-life experiences of waiting in line at a deli or to get into a show before doors open. Queuing is a first in, first out (FIFO) data structure that enables us to keep track of what order tasks should be completed in based on when they entered the "waiting line."

## What might a simple queue look like?

The simplest implementation of a queue in Ruby would be class with an array as the primary mechanism for storing items "in line," and a few methods for interacting with those items:

```
class Queue
  attr_accessor :items

  def initialize
    @items = []
  end

  def queue(new_item)
    @items << new_item
  end

  def empty?
    @items.empty?
  end

  def peek
    @items.first
  end

  def dequeue
    if @items.empty?
      raise QueueIsEmpty
    else
      @items.shift
    end
  end
end

class QueueIsEmpty < StandardError
end

```

An upside of this methodology is that it's simple. We already know how to do some common operations on an array, so it's not very hard to imagine how we might implement a class to use an array specifically as a queue. However, this could get inefficient over time. What if we had to factor in any extra complexity, like whether or not certain items in the queue are weighted because of their urgency? What if, like the grocery store, we had multiple queues running at once in a single instance? What if we needed to scale our solution to hundreds or thousands of items in a given queue? We would need to then concern ourselves with a more robust data structure that can treat these concurrent "waiting lines" simultaneously, as threads.

## The Queue in Ruby

Ruby provides a native `Queue` class that is very similar to our array implementation above, but provides a mechanism for handling multiple threads concurrently. A `Thread` is also its own class in the Ruby Standard Library, and is Ruby's native solution to the need for concurrent programming solutions.

Concurrency is simply when one task starts before others finish, allowing us to finish work more efficiently. Imagine that we need to read and organize the contents of a file, line by line. We know how to do this using Ruby's `File` class and its methods, but what if that file is The Complete Works of Shakespeare? It's 124,000 lines long! If we had, say, four threads working on processing the file simultaneously, we could finish whatever we are trying to do with it much more quickly.

Here's [a simple example from an excellent blog post on threads](http://tinyurl.com/pc6jqf2) that you can run right in your terminal and observe.

## Professional Implementations of Queuing

Developers using queues in Rails have traditionally reached for back-end library support using [Resque](https://github.com/resque/resque) along with [Redis](http://redis.io/) or [Sidekiq](https://github.com/mperham/sidekiq). In the past, Rails developers usually had to write classes in their Rails apps that could interface with these solutions via a Rake task, because ActiveRecord/Rails didn't have any opinion or interface to deal with queuing. However, Rails 4.2 changed that with the addition of [ActiveJob](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/). ActiveJob acts as "an adapter layer on top of queueing systems like Resque, Delayed Job, Sidekiq, and more." The major advantage of this is that once you configure your application to use ActiveJob, you can swap out the back-end library or servicer for them without changes, because Rails simply handles the interface. It's still a fairly new feature, but you may see it in future projects if you work with Rails.

## Share an example of queueing system that allows legacy code to run with a modern Rails client-side implementation

(clinic only)

