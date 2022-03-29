class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedLists
  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
  end

  def size(node = @head)
    return 0 if node.nil?
    1 + size(node.next_node)
  end

  def head
    @head
  end

  def tail(node = @head)
    return node if node.next_node.nil?
    tail(node.next_node)
  end

  def at(index, node = @head)
    return node if index == 0
    at(index - 1, node.next_node)
  end

  def pop
    return nil if @head.nil?
    return @head if @head.next_node.nil?
    current = @head
    while current.next_node.next_node != nil
      current = current.next_node
    end
    current.next_node = nil
  end

  def contains?(value, node = @head)
    return true if node.value == value
    return false if node.next_node.nil?
    contains?(value, node.next_node)
  end

  def find(value, node = @head, index = 0)
    return index if node.value == value
    return nil if node.next_node.nil?
    find(value, node.next_node, index + 1)
  end

  def to_s
    return nil if @head.nil?
    current = @head
    loop do
      print "#{current.value} -> "
      current = current.next_node
      break print "nil" if current.nil?
    end
  end
end
