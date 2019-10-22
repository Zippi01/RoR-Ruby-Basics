a = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494,
     14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574,
     556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319,
     314, 430, 55, 336]
puts "Кількість елементів в масиві:"
puts a.size

puts "Перевернуть масив:"
print a.reverse
puts ''

puts "Відсортувати від меншого до більшого:"
print a.sort
puts ''


puts "Відсортувати від більшого до меншого:"
print a.sort.reverse
puts ''

puts "Видалити всі непарні числа:"
a.delete_if &:odd?
print a
puts ''

puts "Залишити тільки ті числа, які без остічі діляться на 3:"
a.each do |arr|
  if arr % 3 == 0
    print arr
    print ' '
  end
end
puts ''

puts "Видалити числа з масива які повторюються:"
print a.uniq
puts ''

puts "Розділить кожен елемент на 10,
в результаті всі елементи не повинні бути округлені до цілого:"
a.each do |arr|
print arr/10.to_f," "
end
puts ''

puts "Отримати новий масив, який би містив в собі ті букви англійського алфавіту,
порядковий номер якого є в нашому масиві:"
new_a=('a'..'z').to_a
a_abc=Array.new()
puts a.size
(0..a.size-1).each do |i|
  (0..new_a.size-1).each do |y|
    if a[i]==y
      a_abc << new_a[y]
    end
  end
end
print a_abc,"\n"

puts "Поміняти місцями мінімальний і максимальний елементи масива:"
puts a.min
puts a.max
print a
puts ''
puts ''
n = a.max
m = a.min
d = a.index( n )
c = a.index( m )
a[ d ] = m
a[ c ] = n
print a
puts ''

puts "Знайти елемент який знаходиться перед мінімальним числом в масиві:"
print "Мінімальне число: "
puts a.min
n = a.index(a.min)
print "Число перед мінімальним: "
puts a[n-1]

puts "Необхідно знайти три найменших елемента: "
puts a.min
a.delete(a.min)
puts a.min
a.delete(a.min)
puts a.min
