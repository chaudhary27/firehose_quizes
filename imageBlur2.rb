require 'minitest/autorun'

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

	def index_of_ones
		@ones_indexes = Array.new

		pixels.each_with_index do |row, row_index|
			row.each_with_index do |num, num_index|
				@ones_indexes.push(row_index, num_index) if num == 1
			end
		end
	end

	def transform_pixels
		@ones_indexes.each do |m, n|
			m = @ones_indexes.shift
			n = @ones_indexes.shift

			pixels[m-1][n] = 1 if pixels[m-1][n] != nil
			pixels[m+1][n] = 1 if pixels[m+1][n] != nil
			pixels[m][n-1] = 1 if pixels[m][n-1] != nil
			pixels[m][n+1] = 1 if pixels[m][n+1] != nil
		end
	end

	def output_tranformed_pixels
		string_of_pixels = @pixels.join("")
		result = string_of_pixels.scan(/.{1,4}/).join("\n")
		puts result
		result
	end

end

=begin
image = Image.new([
			[0,0,0,0],
			[0,1,0,0],
			[0,0,0,0],
			[0,0,0,0]
		])

=end


class TestStack < MiniTest::Test
	def test_image_blur_output
		image = Image.new([
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 0]
		])
		image.index_of_ones
		image.transform_pixels
		output = image.output_tranformed_pixels
		assert_equal "0100\n1110\n0100\n0000", output
	end
end
