#Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального .
a = [0, 2, 0, 1, 5, 6]
puts a[a.rindex(a.min)...a.index(a.last)].size
