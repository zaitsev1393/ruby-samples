# You get an array of positive integers. 
# Write a function that creates from them the largest possible number. 
# For example, given [81, 8, 299, 85] the result will be 88581299.

input = [111111,32, 328, 3, 123, 54, 123, 65, 33434, 123, 54, 345, 2, 23, 123232, 435, 234, 564, 2, 43,123, 15, 653,123]

def max_number input
  input.map(&:to_s).sort { |a,b| b + a <=> a + b }
end