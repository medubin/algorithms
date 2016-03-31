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
  attr_reader :tail, :head
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
    @head.val unless @head.nil?
    nil
  end

  def last
    @tail.val unless @tail.nil?
    nil
  end

  def empty?
    @head == nil?
  end

  def get(key)
    current = @head
    until current.nil?
      return current.val if current.key == key
      current = current.next
    end
    nil
  end

  def include?(key)
    current = @head
    until current.nil?
      return true if current.key == key
      current = current.next
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    unless @tail.nil?
      new_link.prev = @tail
      @tail.next = new_link
      @tail = new_link
    else
      @head = new_link
      @tail = new_link
    end
  end

  def remove(key)
    current = @head
    until current.nil?
      if current.key == key
        current.next.prev = current.prev unless current.next.nil?
        current.prev.next = current.next unless current.prev.nil?

        @head = current.next if @head == current
        @tail = current.prev if @tail == current
        current.next, current.prev = nil, nil
        break
      end
      current = current.next
    end
  end

  def each(&prc)
    current = @head
    until current.nil?
      prc.call(current)
      current = current.next
    end

  end


  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
