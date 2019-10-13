#Дан целочисленный массив и число К. Если существует элемент, больший К, то вывести true; в противном случае вывести false.
a = [1, 2, 3, 4, 5, 6, 7]
k = 8
bool = false
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i] > k
    bool=true
  else
    bool=false
  end
end
puts bool
