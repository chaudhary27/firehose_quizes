#require 'minitest/autorun'
#require 'benchmark'

def recursive_fib(num)
    if num <= 1
        return num
    else
        recursive_fib(num - 1) + recursive_fib(num-2)
    end

end
puts recursive_fib(10) # => 55
=begin
def iterative_fib(num)

end
=end
