require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    key_hash = key.hash
    bucket = key_hash % @store.count
    if @store[bucket].include?(key)
      @store[bucket].remove(key)
      @store[bucket].insert(key, val)
    else
      @store[bucket].insert(key, val)
    end
  end

  def get(key)
    key_hash = key.hash
    bucket = key_hash % @store.count
    @store[bucket].get(key)
  end

  def delete(key)
    key_hash = key.hash
    bucket = key_hash % @store.count
    @store[bucket].remove(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
