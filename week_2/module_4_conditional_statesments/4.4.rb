"""
Написати програму (замість #type your code here), яка б запитувала користувача ввести з консолі ціле число у форматі “Enter integer number”.

Записати це число у змінну number.

Вивести в консоль за допомогою методу puts інформацію чи є число number парним, чи непарним у вигляді:
“number is even” (якщо число парне) чи “number is odd” (якщо число непарне)

Наприклад, програма запитує користувача Enter integer number
Користувач вводить число -3
В консоль виводиться інформація -3 is odd
"""

def parity() 
    puts("Enter integer number")
    number = gets.chomp.to_i   

    if (number % 2) == 0
        puts(number.to_s + " is even")
    elsif (number % 2) == 1
        then puts(number.to_s + " is odd")
    end
end

parity() 
      