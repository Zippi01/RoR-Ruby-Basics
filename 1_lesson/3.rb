a = [1, 5, 3, 4, 5, 6]
puts a.index { |i| a[0] < i && i < a[-1] } || []
