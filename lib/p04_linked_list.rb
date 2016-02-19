require 'byebug'

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
  include Enumerable
  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def get(key)
    answer = nil
    current_link = first
    until current_link == nil
      return current_link.val if current_link.key == key
      current_link = current_link.next
    end
    answer
  end

  def include?(key)
    current_link = first
    until current_link == nil
      return true if current_link.key == key
      current_link = current_link.next
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    unless @tail.nil?
      last_link = @tail
      last_link.next = new_link
      new_link.prev = last_link
    end

    @tail = new_link
    @head = new_link if @head.nil?
  end

  def remove(key)
    target_link = nil
    current_link = @head
    until current_link == nil
      target_link = current_link if current_link.key == key
      current_link = current_link.next
    end

    prev_link = target_link.prev
    next_link = target_link.next

    if prev_link.nil? && next_link.nil?
      @tail = nil
      @head = nil
    elsif prev_link.nil? && !next_link.nil?
      @head = next_link
    elsif !prev_link.nil? && next_link.nil?
      @tail = prev_link
    else
      prev_link.next = next_link
      next_link.prev = prev_link
    end

    target_link.next = nil
    target_link.prev = nil
  end

  def each
    current_link = @head
    until current_link == nil
      yield current_link
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
