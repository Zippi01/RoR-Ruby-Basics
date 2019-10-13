#Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.
a = [9, 4, 8, 7, 6, 3, 3]
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i]%2 == 1
    print a[i], ' '
  end
end
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i]%2 == 0
    print a[i], ' '
  end
end
puts ''
