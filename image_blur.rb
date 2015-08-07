require 'minitest/autorun'

class Image

	def initialize(pixels)
		@pixels = pixels
	end

	def output_image
		result = @pixels.join("")
		output = result.scan(/.{1,4}/).join("\n")
		puts output
		output
	end

end

=begin
image = Image.new([
	[0, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 1],
	[0, 0, 0, 0]
	])

image.output_image
=end

class TestStack < MiniTest::Test
	def test_image_blur_output
		image = Image.new([
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 0, 0, 1],
		[0, 0, 0, 0]
		])
		output = image.output_image
		assert_equal "0000\n0100\n0001\n0000", output
	end
end
