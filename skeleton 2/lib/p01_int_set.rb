require "set"

class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @store = Array.new(max,false)
    # @max_set = (0..max).to_a
    @max = max
    @set = Set.new([])
  end

  def insert(num)
    
    if is_valid?(num) && !include?(num) 
      @store[num] = true
      @set.add(num)
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    if include?(num)
      @set.delete(num) 
      @store[num] = false
    end
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, max)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @set = Set.new([])
  end

  def insert(num)
    if !include?(num)
      @set.add(num)
      self[num].push(num)
    end
  end

  def remove(num)
    if include?(num)
      @set.delete(num) 
      self[num].delete(num)
      
    end

  end

  def include?(num)
    self[num].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @set = Set.new([])
  end

  def insert(num)
    if !include?(num)
      @set.add(num)
      self[num].push(num)
      @count += 1
      if @store.length == @count
        self.resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      @set.delete(num) 
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store = Array.new(@store.length * 2) { Array.new }
    @set.each do |num|
      self[num] << num
    end 
  end
end
