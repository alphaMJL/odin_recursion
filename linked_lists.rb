# This is my implementation of linked-lists in Ruby


class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  # adds a new node containing value to the end of the list
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    current_node = @head
    else
      current_node = @head
      until current_node.next_node == nil do
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end
  # adds a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
  end

  def size
    if @head.nil?
      return 0
    end
    current_node = @head
    count = 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

# returns the first node in the list
  def head
    if @head.nil?
      nil
    else
       @head
    end
  end

  # tail returns the last node in the list
  def tail
    current_node = @head
    until current_node.next_node.nil? do
      current_node = current_node.next_node
    end
  current_node
  end

  #at(index) returns the node at the given index
  # honestly I don't really understand this requirement. I don't even know what 
  # an index is of a linked list. Here is my guess
  def at(index)
    #no items is -1
    count = -1
    current_node = @head
    until count == index do
      current_node = current_node.next_node
      count += 1
    end
    current_node
  end

  # pop removes the last element from the list
  def pop 
    return nil if @head.nil?
    current_node = @head
    if @head.next_node.nil?
      @head = nil
    end

    until current_node.next_node.next_node.nil? do
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end 
  #  returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    return nil if @head.nil?
    current_node = @head
    until current_node.next_node.nil? do
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node

    end
    return true if current_node.value == value
    return false
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    return nil if @head.nil?
    current_node = @head
    # no items is -1, one items is index 0
    count = -1
    until current_node.next_node.nil? do
      if current_node.value == value
        return count
      end
      current_node = current_node.next_node
      count += 1

    end
    return count if current_node.value == value
    return nil
  end
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
  def to_s
    return nil if @head.nil?
    current_node = @head
    print_array = []
    until current_node.next_node.nil? do
      current_node = current_node.next_node
      print_array.push(current_node.value.to_s)

    end
    current_node.value = current_node.value.to_s
    print_array.push(nil)
    print print_array.join( ' -> ' )
  end
end


class Node

  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = nil
  end

end

test_list = LinkedList.new
test_list.append('cats')
test_list.append('whales')
test_list.append('dogs')
test_list.append('foxes')
test_list.append(1)
test_list.append(2)
test_list.append(3)
test_list.prepend('This to front!')


p test_list
p test_list.size
p test_list.head.value
p test_list.tail.value
p test_list.at(2).value

puts "pop opertation"
test_list.pop
p test_list

puts "contains?"
p test_list.contains?('dogs')

puts "find"
p test_list.find('dogs')

p "to string"
p test_list.to_s
p test_list

puts "empty list"
empty_list = LinkedList.new
p empty_list.size
p empty_list.head

p "find on empty"
p empty_list.find('dogs')


