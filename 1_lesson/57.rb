#Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.
a = [8, 9, 4, 1, 5, 6]
n = a.index(a.min)
m = a.index(a.max)
if n < m
  puts n
else
  puts m
end
