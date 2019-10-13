#Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.
a = [1, 2, 3, 4, 5, 6]
print a.first, ' '
a.index(a.first)+1.upto(a.index(a.last)-1) do |i|
  if a[i]%2 == 0
    print a[i]+=a.last,' '
  else
    print a[i], ' '
  end
end
puts a.last
