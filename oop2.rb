# Ken and Allen's solution
# Go over this with Dave

class Card
	attr_accessor :rank, :suit
 
	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end
 
	def output_card
		puts "#{self.rank} of #{self.suit}"
	end
 
	# def self.random_card
	# 	Card.new(rand(10), :spades)
	# end
end
 
class Deck
	def initialize
		@cards = []
		# @cards << Card.new(10, :spades)
		# @cards << Card.new(9, :diamonds)
		# I didn't like the idea of typing out 52 cards
		# with the above method so I opted to build them
		# by looping through 2 arrays.
		ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
		suits = %w{Spades Hearts Diamonds Clubs}
			suits.each do |suit|
  				ranks.size.times do |i|
    				@cards << Card.new( ranks[i], suit )
  				end
			end
	end
 
	def shuffle
		@cards.shuffle!
	end
 
	def output
		@cards.each do |card|
			card.output_card
		end
	end
 
	def deal
		return @cards.shift # return the actual card object
	end
 
	def count
		return @cards.count
	end
 
 
end
 
deck = Deck.new
deck.shuffle
 
puts "Cards shuffled. Type \"deal\" to deal a card."
deal = "deal"
 
while deal != "quit" && deck.count > 0
	print "> "
	deal = $stdin.gets.chomp
 
	if deal == "deal"
		card = deck.deal
		card.output_card
		puts "#{deck.count} cards left. Deal again?"
		if deck.count > 0
		 	puts "Deal again?"
		else
		 	puts "Game over."
		end
 
	elsif deal != 'quit'
		puts "Type \"deal\" to deal a card or \"quit\" to quit."
	end
 
end