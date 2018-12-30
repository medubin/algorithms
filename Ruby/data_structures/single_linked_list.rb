class Node
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
    @next = nil
  end
end

class SingleLinkedList
  attr_reader :tail, :head

  def initialize
    @tail = nil
    @head = nil
  end

  def push(node)
    @head = node if @head.nil?
    @tail.next = node if !@tail
    @tail = node
  end

  def shift
    old_head = @head
    @head = @head.next
    old_head.next = nil
    old_head
  end
end
