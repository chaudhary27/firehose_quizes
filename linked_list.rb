
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
    attr_reader :data
    
    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
        # IMPLEMENT ME!
        if data.nil?
        	data = LinkedListNode(value, nil)
        else
        	data = LinkedListNode(value, data)
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # I RETURN A VALUE
        popped = data.value
        # shifting the data
        data = data.next_node
    end

end

def reverse_list(list)
    # ADD CODE HERE
    #list = Sack.pop

    while list
        # ADD CODE HERE
        # While list what?
        list = list.next_node
    end

    # ADD CODE HERE
end




print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)











