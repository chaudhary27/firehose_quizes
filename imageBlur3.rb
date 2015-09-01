require 'minitest/autorun'

class Image
	attr_accessor :pixels

	def initialize(pixels)
		@pixels = pixels
	end


	def blur(distance)
		distance.times do
			index_of_ones
			change_adjacents
		end

	end

	def index_of_ones
		@ones_indexes = Array.new

		pixels.each_with_index do |row, row_index|
			row.each_with_index do |num, num_index|
				@ones_indexes.push([row_index, num_index]) if num == 1
			end
		end
	end






=begin
	def transform(row, column)
		p = pixels[row][column]

		if row < 0 || column < 0
			return 0
		end

	end
=end
	# checking if the row above and settin nil
	def upper_edge?(row,col)
		pixels[row-1][col] == nil
	end

	# checking if the row below and setting nil
	def lower_edge?(row,col)
		pixels[row+1][col] == nil
	end

	# checking right column and setting nil
	def right_edge?(row,col)
		pixels[row][col-1] == nil
	end

	# checking left column and setting nil
	def left_edge?(row,col)
		pixels[row][col+1] == nil
	end

	#setting pixels[y][x] == 1 for adjacents use
	def set_one(row,col)
		pixels[row][col] = 1
	end

	def adjacents_up(row,col)
		set_one(row-1, col) unless row == 0 || upper_edge?(row,col)
	end

	def adjacents_down(row,col)
		set_one(row+1, col) unless row == @pixels.length - 1 || lower_edge?(row,col)
	end

	def adjacents_right(row,col)
		set_one(row, col-1) unless col == 0 || right_edge?(row,col)
	end

	def adjacents_left(row,col)
		set_one(row, col+1) unless col == @pixels[row].length - 1 || left_edge?(row,col)
	end


	def change_adjacents
		@ones_indexes.each do |row, col|
			adjacents_up(row,col)
			adjacents_down(row,col)
			adjacents_left(row,col)
			adjacents_right(row,col)
	end

=begin
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

=end
	def output_tranformed_pixels
		string_of_pixels = @pixels.join("")
		result = string_of_pixels.scan(/.{1,9}/).join("\n")
		#puts result
		puts result
		result
	end

end



class TestStack < MiniTest::Test
=begin
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
=end
	def test_image_blur_manhattan_distance
		image = Image.new([
			[1,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,1,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,1]
			])
		image.blur(3)
		output = image.output_tranformed_pixels
		assert_equal "000000000\n000000000\n000000000\n000000000\n000000000\n000000000\n000000000\n000000000\n000000001\n000000011\n000000111\n000001111", output
	end
end
end
