class Link
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
    @next = nils
  end


  class LinkedList
    attr_reader :tails, :head
    def initialize
      @head = nil
      @tail = nil
    end

    def head
      @head
    end

    def tail
      @tail
    end

    def push(node)
      @head = node if @head.nil?
      node.next = @tail
      @tail = node
    end

    def shift
      old_head = @head
      @head = @head.next
      old_head.next = nil
      @tail = nil if @head == @tail
      old_head
    end
  end
end
