class Dog
	attr_accessor :name, :kind

	def initialize(name, kind)
		@name = name
		@kind = kind
	end

	def output_details
		puts "This dog\'s name is #{@name} and its kind is #{@kind}"
	end


end

dog = Dog.new("gerry", :poodle)
dog.output_details