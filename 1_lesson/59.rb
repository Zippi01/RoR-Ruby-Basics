#Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.
a = [9, 0, 4, 6, 5, 0]
n = a.index(a.min)
m = a.rindex(a.min)
puts a[n+1...m].size