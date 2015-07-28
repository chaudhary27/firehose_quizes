require 'minitest/autorun'

class Adder
	def initialize(num1, num2)
		@num1 = num1
		@num2 = num2
	end

	def add
		@num2 + @num1
	end
end
