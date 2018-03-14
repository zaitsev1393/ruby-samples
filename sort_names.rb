names = %w(Alex Arik Rebecca Rose Brad Viki Norman Drake Carrie Taylor Frank Robert Spencer Chris)

def sort_names(names, letter)
	new_names = []
	letter.downcase!
	names.select! { |name| name.include?(letter) || name.include?(letter.upcase)}
	names.delete_if { |name| new_names << name if name[0] == letter.upcase}
	new_names.sort + names.sort
end

p sort_names(names, 'A')