require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    key = key.hash
    @store[key % @store.size] << key
    @count += 1
    resize! if count > @store.length
  end

  def include?(key)
    key = key.hash
    @store[key % @store.size].include?(key)
  end

  def remove(key)
    key = key.hash
    @store[key % @store.size].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.flatten.each do |num|
      insert(num)
    end
  end
end
