class Animal
	def eat
		puts "on nom nom"
	end
end

class Dog < Animal

	def bark
		puts "woof"
	end
	
end

class Cat < Animal
	def meow
		puts "meow"
	end
end

class Duck < Animal
	def quack
		puts "quack"
	end

end

class GoldenRetriever < Dog

	def fetch
		puts "running and getting it"
	end

end

class Poodle < Dog
	def dance
		puts "poodle can dance and jump"
		
	end
end

animal = Animal.new # building an animal
#animal.eat # trigger eating functionality

dog = Dog.new
#dog.eat
#dog.bark

cat = Cat.new
#cat.eat
#cat.meow

duck = Duck.new
#duck.eat
#duck.quack

poodle = Poodle.new
#poodle.eat
#poodle.bark
#poodle.dance

gr = GoldenRetriever.new
#gr.eat
#gr.bark
#gr.fetch


puts gr.is_a?(Poodle)
