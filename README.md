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
