require 'minitest/autorun'

class Luhn

    def initialize(number)
        @number = number
    end

    def is_valid?
		digits = @number.to_s.chars.map(&:to_i)
        puts digits.inspect
        digits.reverse!
        sum = 0
        digits.each_with_index.map do |item, index|
            #puts item
            if (index % 2 != 0)
                item = item * 2
                if item >= 10
                    sum += item - 9
                    else
                        sum += item
                end
            end
            if (index % 2 == 0)
                sum +=item
            end
        end
        return sum % 10 == 0

	end

end

#luhn = Luhn.new(4194560385008504)
#output = luhn.is_valid?


class TestLuhn < MiniTest::Unit::TestCase

	def test_luhn_valid
        luhn = Luhn.new(4194560385008504)
		assert luhn.is_valid?
	end

	def test_luhn_invalid
        luhn = Luhn.new(4194560385008505)
		assert(!luhn.is_valid?)
	end

end
