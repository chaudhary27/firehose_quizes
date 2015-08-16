class Image
	attr_accessor :pixels
	def initialize(pixels)
		@pixels = pixels
	end

=begin
	def neat
		result = @pixels.join("")
		@output = result.scan(/.{1,4}/).join("\n")
		@output
	end
=end

	def transform
		empty_arr = []
		@pixels.each do |i|
			if i == 1
				empty_arr << i
			else

			end
			puts empty_arr
		end
		
	end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
  ])

puts image.transform
