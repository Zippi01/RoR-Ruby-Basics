#Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.
a = [9, 4, 8, 7, -6, 3, 3]
summ = 0
a.index(a.first).upto(a.index(a.last)) do |i|
  summ=summ+a[i].abs
end
print summ.to_f/(a.index(a.last)+1)
puts ''
