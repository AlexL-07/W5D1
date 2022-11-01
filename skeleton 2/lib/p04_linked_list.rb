class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new("head", :head)
    @tail = Node.new("tail", :tail)
    @head.next = @tail
    @tail.prev = @head
    @current_node = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next 
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.next == nil
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val) #{key=>val}
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    new_arr = []
    until @current_node == @tail.prev
      @current_node = @current_node.next
      new_arr << @current_node.val
    end

    new_arr
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
