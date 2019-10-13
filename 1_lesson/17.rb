a = [3, 2, 9, 1, 5, 6]
puts ((1..a.size-2).to_a.select{ |i| (a[i] > a[i-1]) && (a[i] > a[i+1])}.size)
