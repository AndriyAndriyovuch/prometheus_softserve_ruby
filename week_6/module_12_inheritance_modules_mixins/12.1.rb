"""
Створити модуль ConsoleInput для введення з клавіатури різних типів даних: рядків, чисел (цілих та дійсних), символів, хешів.

Визначити в цьому модулі методи: string (користувач може вводити будь-які символи, метод повертає рядок), number (користувач може вводити або цілі числа або числа з десятковою крапкою чи десятковою комою, метод повертає або ціле або дійсне число), symbol (користувач буде вводити будь-які букви, метод повертає Symbol, що відповідає цим буквам), hash (користувач повинен вводити hash у форматі key: value або key => value, метод повертає хеш, що містить один елемент із введеним ключем та значенням).

Ці методи будуть запитувати користувача про введення відповідних даних
Для number - Enter any number
Для hash - Enter hash in format 'key: value' or 'key => value'
Для symbol - Enter any letters
Для рядка - Enter any string
"""

module ConsoleInput
    def number
        puts("Enter any number")
        input = gets.strip.chomp.to_f
        input % 1 == 0 ? input.to_i : input
    end
    
    def hash
        puts("Enter hash in format 'key: value' or 'key => value'")
        input = gets.chomp
        
        if input.include?(':')
            hash_array = input.split(":")
            return {(hash_array[0].strip)=>(hash_array[1].strip)}
        elsif input.include?("=>")
            hash_array = input.split("=>")
            return {(hash_array[0].strip)=>(hash_array[1].strip)}
        end
    end
    
    def symbol
        puts("Enter any letters")
        input = gets.chomp
        input.to_sym
    end
    
    def string
        puts("Enter any string")
        input = gets.chomp
        input
    end
    
end
