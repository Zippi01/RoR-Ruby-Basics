#Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.
a = [9, 0, 4, 9, 7]
n = a.index(a.max)
m = a.rindex(a.max)
puts a[n+1...m].size
