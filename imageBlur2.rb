require 'minitest/autorun'

class Image
	attr_accessor :pixels

	def initialize(pixels)
		puts pixels.inspect
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
				@ones_indexes.push([row_index, num_index]) if num == 1
			end
		end
		puts "-------"
		puts pixels.inspect
		puts "--"
		puts @ones_indexes.inspect
		puts "-------"
	end


	def transform(row, column)

		p = pixels[row][column]

		if row < 0 || column < 0
			return 0
		end

		if p != nil
			return 1
		end
	end

	def transform_pixels
		@ones_indexes.each do |row_by_column|
			
			m = row_by_column[0]
			n = row_by_column[1]

			pixels[m-1][n] = transform(m-1, n)
			pixels[m+1][n] = transform(m+1, n)
			pixels[m][n-1] = transform(m, n-1)
			pixels[m][n+1] = transform(m, n+1)
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
	def test_image_blur_1_output
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

	def test_image_blur_2_output
		image = Image.new([
		[0, 0, 0, 0],
		[0, 0, 1, 0],
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 0]
		])
		image.index_of_ones
		image.transform_pixels
		output = image.output_tranformed_pixels
		assert_equal "0010\n0111\n0110\n1110\n0100\n0000", output
	end

	def test_image_blur_3_output_edge_case
		image = Image.new([	
		[0, 1, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 1],
		[0, 0, 0, 0]
		])
		image.index_of_ones
		image.transform_pixels
		output = image.output_tranformed_pixels
		assert_equal "1110\n0100\n0001\n0011\n0001", output
	end
end
