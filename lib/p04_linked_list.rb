class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  def initialize
    @head = nil
    @list = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
  end

  def get(key)
    @list.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    @list.each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    @list.unshift(new_link)
    new_link.prev = nil
    new_link.next = @list[1] unless @list[1].nil?
    @head = @list[0]
  end

  def remove(key)
    target_link = nil
    target_idx = nil
    @list.each_with_index do |link, idx|
      if link.key == key
        target_link = link
        target_idx = idx
      end
    end
    @list[target_idx - 1].next = @list[target_idx + 1] unless @list[target_idx - 1].nil?
    @list[target_idx + 1].prev = @list[target_idx - 1] unless @list[target_idx + 1].nil?
    @list.delete(target_link)
  end

  def each
    @list.length.times do |i|
      yield @list[i]
    end
    @list
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
