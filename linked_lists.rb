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
      append_node = @head
      append_node = append_node.next_node until append_node.next_node.nil?
      append_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = if @head.nil?
        Node.new(value)
      else
        Node.new(value, @head)
      end
  end

  def size(node = @head, count = 1)
    return count if node.next_node.nil?

    size(node.next_node, count + 1)
  end

  def head(_node = @head)
    @head.value
  end

  def tail(node = @head)
    return node.value if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head)
    return node.value if index == 0

    at(index - 1, node.next_node)
  end

  def pop
    return nil if @head.nil?
    return @head if @head.next_node.nil?

    actual_node = @head
    actual_node = actual_node.next_node until actual_node.next_node.next_node.nil?
    actual_node.next_node = nil
  end

  def contains?(value, node = @head)
    return true if node.value == value
    return false if node.next_node.nil?

    contains?(value, node.next_node)
  end

  def find(value, index = 0, node = @head)
    return index if node.value == value
    return nil if node.next_node.nil?

    find(value, index + 1, node.next_node)
  end

  def to_s(node = @head)
    node_string = String.new
    loop do
      node_string += "#{node.value} -> "
      node = node.next_node
      break node_string += 'nil' if node.nil?
    end
    print node_string
  end
end
