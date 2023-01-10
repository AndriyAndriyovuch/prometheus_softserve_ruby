"""
Написати метод, який порахує кількість слів у реченні. Словом будемо вважати набір символів, який відокремлений пробілами (початок і кінець речення відповідно містять слова, які відокремлені лише одним пробілом)

Приклад введених даних і результат:

puts(count_words("Hello World")) # 2
puts(count_words("This is a ball")) # 4
"""

def count_words(sentence)
    sentence.split(' ').count
end