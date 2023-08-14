def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

What is the purpose of the number % divisor == 0 ?
# It shows which divisors don't leave a remainder, 
# showing they go into number evenly.

What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# We want factors to be the return value. Otherwise, it will return the last value, returning a value of nil.

