#Дан целочисленный массив и целое число К. Возвести в степень К все элементы массива.
a = [7, 1, 2, 4, 3, 5, 9]
k = 2
a.index(a.first).upto(a.index(a.last)) do |i|
  a[i]= a[i]**k
end
print a, ' '
puts ''
