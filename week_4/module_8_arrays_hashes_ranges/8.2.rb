"""
Написати метод для обчислення кількості деяких елементів масиву. Метод приймає два параметри arr – масив з елементами, el – значення, для якого потрібно визначити кількість таких елементів в масиві arr

Приклад введених даних і результат:

puts(count_repetitions([1,1,5,2,2,3,3,5,5], 5)) # 3
puts(count_repetitions([3,3,1,2,0], 5)) # 0
"""

def count_repetitions(arr, el)
    arr.count(el)
end