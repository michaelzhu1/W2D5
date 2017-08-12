require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end


  def insert(key)
    self[key] << key unless include?(key)
    @count += 1
    resize! if @count >= num_buckets
  end

  def include?(key)
    return true if self[key].include?(key)
    false
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
    end
    @count -= 1
  end

  private

  def [](key)#return correct bucket position
    @store[key.hash % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    old_store = @store.dup.flatten
    @store = Array.new(old_store.length * 2) {Array.new}

    old_store.each do |el|
      insert(el)
    end

  end
end
