
class BinaryTree
	attr_accessor :payload, :left, :right
	def initialize(payload, left=nil, right=nil)
		@payload = payload
		@left = left
		@right = right
	end

	def bTree(unsorted_array)

		first_element = unsorted_array[0] # taking first value in unsorted_array and setting it equal to first_element
		@base_of_tree = BinaryTree.new(first_element) #building BinaryTree class with that first_element as base_of_tree
		prev_element     = @base_of_tree
		unsorted_array.each do |number|
			puts "number =  #{number}"
			insert(number, @base_of_tree)
			end
		@sorted_array = []
		treeTraverse
	end

	def insert(number, base_of_tree)
		prev_element = @base_of_tree

		while prev_element != nil
			if number < prev_element.payload && prev_element.left == nil
				prev_element.left = BinaryTree.new(number)
				puts "inserted #{number} to the left of #{prev_element.payload}"
				prev_element      = @base_of_tree

			elsif number > prev_element.payload && prev_element.right == nil
				prev_element.right = BinaryTree.new(number)
				puts "inserted #{number} to the right of #{prev_element.payload}"
				prev_element       = @base_of_tree

			elsif number < prev_element.payload && prev_element.left != nil
				puts "moved #{number} past #{prev_element.payload} to #{prev_element.left.payload}"
				prev_element = prev_element.left

			elsif number > prev_element.payload && prev_element.right != nil
				puts "moved #{number} past #{prev_element.payload} to #{prev_element.right.payload}"
				prev_element = prev_element.right
			else
				return
			end
		end					
	end

	def treeTraverse(node = @base_of_tree)
		return @sorted_array if (node == nil)
		treeTraverse(node.left)
		@sorted_array.push(node.payload)
		treeTraverse(node.right)	
	end

end





unsorted_array = [7,4,9,1,6,14,10]
sorted_array_1 = BinaryTree.new(unsorted_array[0])
sorted_array = sorted_array_1.bTree(unsorted_array)
print "sorted_array = "
print sorted_array
puts "\n"















