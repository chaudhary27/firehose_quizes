
 A = [1,2,3,4].inject(){ |sum, x| sum + x}

puts A

hash = [[:first_name, 'faisal'],[:last_name, 'farooq']].inject({}) do |result, element|
	result[element.first] = element.last
	result
end
puts hash