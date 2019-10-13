#Дан целочисленный массив. Заменить все положительные элементы на значение минимального.
a = [1, -2, 3, 4, -5, 6]
a.index(a.first).upto(a.index(a.last))  do |i|
  if a[i]>0
    print a[i] = a.min, ' '
  else
    print a[i], ' '
  end
end
puts ''
