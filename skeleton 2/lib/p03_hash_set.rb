class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @set = Set.new({})
  end

  def insert(key)
    if !include?(key)
      @set.add(key)
      self[key].push(key)
      @count += 1
      if @store.length == @count
        self.resize!
      end
    end
  end

  def include?(key)
    self[key].include?(key) 
  end

  def remove(key)
    if include?(key)
      @set.delete(key) 
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
