# Resources --> OOP --> self directed exercise
=begin
Specification of the Deck
The specification of a deck of cards is as follows:

When a new deck is initialized (Deck.new), it will automatically store each card in an array in the class.
There will be a shuffle method that will randomly order the array of cards in the deck.
There will be deal method, which will return the top card from the deck, and remove it from the array.
How to do it
Define a Deck class
In the Deck class build an initializer
In the initialize method, build up every single card in the deck of cards and store it in an instance (@) variable. This will be an array.
Define a method in the class called shuffle, which will trigger the shuffle method in the instance (@) variable that keeps track of the cards in the deck.
Define a method deal, which will take the top card and pull it off the deck.
=end 
class Card # defining a class
	attr_accessor :rank, :suit

	def initialize(rank, suit) # <-- constructor = initializer 
		@rank = rank # instance variable
		@suit = suit
	end

	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

	#def self.random_card
	#	Card.new(rand(10), :spades)
	#end
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