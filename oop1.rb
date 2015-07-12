class Card # defining a class
	attr_accessor :rank, :suit

	def initialize(rank, suit) # <-- constructor = initializer 
		@rank = rank # instance variable
		@suit = suit
	end

	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

	def self.random_card
		Card.new(rand(10), :spades)
	end
end

class Deck
	def initialize
		@cards = []
		@cards << Card.new(13, :spades)
		@cards << Card.new(13, :diamonds)
		@cards << Card.new(13, :hearts)
		@cards << Card.new(13, :clubs)
	end

	def shuffle
		@cards.shuffle!
	end

	def deal
		@cards.shift
	end

	def output
		@cards.each do |card|
			card.output_card
		end
	end
end



deck = Deck.new

deck.deal
deck.output