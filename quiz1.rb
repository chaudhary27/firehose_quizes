text = "This is awesome"

words = text.split(' ')

words.each do |word|
	letters = word.split(//)
	last = letters.pop
	first = letters.shift
	scramble = letters.shuffle
	scramble = scramble.join("")
	print first+scramble+last+" "
end

