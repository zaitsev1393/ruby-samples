# I have a table (users) with two fields id and name. Write a query that returns the first 5 names that contain 'r'. The order should be: 
# First, words that start with 'r' in alphabetical order.
# Second, words that contain 'r' in alphabetical order.
# So - if my list of names is: Alex, Arik, Rebecca, Rose, Brad, Viki, Norman, Drake, Carrie, Taylor, Frank, Robert, Spencer, and Chris.
# The order of the results should be: Rebecca, Robert, Rose, Brad, Carrie.


names = %w(Alex Arik Rebecca Rose Brad Viki Norman Drake Carrie Taylor Frank Robert Spencer Chris)

def sort_names(names, letter)
	new_names = []
	letter.downcase!
	names.select! { |name| name.include?(letter) || name.include?(letter.upcase)}
	names.delete_if { |name| new_names << name if name[0] == letter.upcase}
	new_names.sort + names.sort
end

p sort_names(names, 'A')