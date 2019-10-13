#Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.
a = [9, 4, 8, 7, -6, 3, 3]
summ = 0
a.index(a.first).upto(a.index(a.last)) do |i|
  summ=summ+a[i]**2
end
print summ.to_f/(a.index(a.last)+1)
puts ''
