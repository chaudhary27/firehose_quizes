
# Build a Reverse LinkedList WITHOUT using Arryas
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end


def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)



class Stack
    attr_reader :head
    
    def initialize
        @head = nil
    end

    # Push a value onto the stack
    def push(value)
        @head = LinkedListNode.new(value, @head)
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # making sure head is not nil
        if head == nil
            return false
        end
        popped = @head.value
        # shifting the data
        @head = head.next_node

        return popped
    end

end

def reverse_list(list)

    new_list = Stack.new
    
    while list.head
        head = list.pop
        new_list.push(head)
    end

    return new_list
end


stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)

new_stack = reverse_list(stack)
new_stack = reverse_list(new_stack)

while new_stack.head
    puts new_stack.pop
end


print_values(node3)

puts "-------"

#revlist = reverse_list(node3)

#print_values(revlist)











