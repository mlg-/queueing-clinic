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
