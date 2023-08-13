Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# The ! or ? at the end of a method is part of its name.

what is != and where should you use it?
# This means 'not equal to' and checks to see if the values of two operands are equal or not. 
# If they are unequal, the condition returns true.

put ! before something, like !user_name
# This is a form of negation. It takes the variable's truthiness then returns the opposite of it.

put ! after something, like words.uniq!
# In many, but not all, cases, this represents that the method is destructive. In other cases, 
# it might be considered to have non-standard functioning.

put ? before something
# This is used to indicate a method will return either true or false

put ? after something
# This is used after methods to evaluate a condition, like method.include?(input).

put !! before something, like !!user_name
# This is a way of forcing the return value to be a boolean.

