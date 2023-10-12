class Tree
  attr_accessor :root
  def initialize(array)
    @root = build_tree(sort_array(array).uniq!)
  end

  def build_tree(array) 
    return nil if array.empty?
    mid = (array.length / 2).floor
    
    root = Node.new(array[mid])
    
    root.left_child = build_tree(array[0...mid])
    root.right_child = build_tree(array[mid+1..-1])

    return root
  end

  def sort_array(array)
    return nil if !array.is_a?(Array) || !array.all? { |item| item.is_a?(Integer) }
    array.sort
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  def insert(value)
    if @root == nil
      @root = Node.new(value)
    else
      current = @root
      find = false
      while !find do
        if (value < current.value)
          if current.left_child.nil?
             current.left_child = Node.new(value)
             find = true
             current.left_child
          end
          current = current.left_child
        else
          if current.right_child.nil?
            current.right_child = Node.new(value)
            find = true
            return current.right_child
          end
          current = current.right_child
        end
      end
    end
  end


  # Going to skip implementing this, I understand the difficulty in reconnecting all
  # the children nodes back behind the deleted node. This could take a while for me to figure
  # out and implement solutions for all cases. May try in the future.
  # 1. target has no children
  # 2. target has left child
  # 3. target has right child
  # 4. target has both children ---this will be the worst one

  #This broken delete will delete the target, but also, all of their children
  
  def delete(value)
    if @root == nil
      return nil
    else
      current = @root
      find = false
      while !find do
        if (value < current.value)
          if current.left_child.value == value
             current.left_child = nil
             find = true
             current.left_child
          end
          current = current.left_child
        else
          if current.right_child.value == value
            current.right_child = nil
            find = true
            return current.right_child
          end
          current = current.right_child
        end
      end
    end
  end
end





class Node
  attr_accessor :value, :left_child, :right_child

  def initialize(value, left_child = nil, right_child = nil)

    @value = value
    @left_child = left_child
    @right_child = right_child
  end
end

new_bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
new_bst.insert(10000)
new_bst.insert(10001)
new_bst.insert(10002)
new_bst.insert(10003)
new_bst.insert(2)

new_bst.pretty_print