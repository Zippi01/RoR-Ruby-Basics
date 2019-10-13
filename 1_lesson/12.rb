#Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.
a = [1, -2, 3, 4, -5, 6]
a.index(a.first).upto(a.index(a.last))  do |i|
  if a[i]<0
    print a[i] = a.max, ' '
  else
    print a[i], ' '
  end
end
puts ''
