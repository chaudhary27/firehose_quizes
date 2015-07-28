######
#   Linked list node
#   @attr   value   mixed   Element data
#   @attr   next_node   LinkedListNode  Next node in list

class LinkedListNode
    attr_accessor :value, :next_node

    def initialize(value, next_node=nil)
        @value = value
        @next_node = next_node
    end

end


#####
#   Print nodes

def print_values(list_node)
    
    print "#{list_node.value} --> "
    
    if list_node.next_node.nil?
        print "nil\n"
        return
    
    else
        print_values(list_node.next_node)
    
    end
    
end


#####
#  LinkedList implementation
#####
class LinkedList
    attr_reader :head
    
    #   Init a linked list using an undefined number of elements
    #   @param  mixed   elements    that the new obj should be initialized with
    def initialize(*elements)
        
        @head = nil
        elements.each { |el| self.push(el) }
        
    end
    
    #   Implement LinkedList reversal without mutation
    #   @return LinkedList new reversed LinkedList
    def self.new_reversed(list)
        
        node = list.head
        new_list = LinkedList.new()
        
        while node
            
            print "#{node.value} \n"
            new_list.push(node.value)
            node = node.next_node
            
        end
        
        return new_list
        
    end
    
    #   Implement inline LinkedList reversal
    def reverse!
        
        # Removed
    
    end
    
    #   Floyds Cycle Detection implementation
    def infinite?
        
        # Removed
        
    end
    
    #   Push item onto the stack
    #   @param  mixed   element that you want to push onto the stack
    def push(element)
        @head = LinkedListNode.new(element, @head)
    end
    
    #   Push existing node (for cycle detection test)
    def push_node(node)
        @head.next_node = node
        @head = node
    end

    #   Remove and return last item from stack
    #   @return mixed
    def pop
        
        last = @head
        
        begin
            @head = last.next_node
            
        rescue NoMethodError #< Nil
            return nil
        
        end
        
        return last
    
    end

end

#####
#   Stub LinkedList reversal without mutation
####

def new_reverse(list)
    return list.new_reversed
end

####
#   Stub Linked List reversal inline
####
def reverse(list)
    list.reverse!
end

##  Main

#   Init
list = LinkedList.new(1,2,3,4,5)
print_values(list.head)

#   Immutable
reversed = LinkedList.new_reversed(list)
print_values(reversed.head)

#   Mutable
reverse(list)
print_values(list.head)

#   Cycle Detection
print "Before cyclical injection: #{list.infinite?} \n"
list.push_node(list.head)
#print_values(list.head)
print "After cyclical injection: #{list.infinite?} \n"