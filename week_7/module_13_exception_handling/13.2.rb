"""
Створити клас PhoneFormatException, який наслідується від StandardError.
Визначити в цьому класі змінну екземпляра, яку ініціалізовувати в конструкторі. 
Інформація про помилку повинна виводитися в форматі: Phone number <тут повинно бути значення номера, який містить неправильний формат> is incorrect. You should enter phone in format +38dddddddddd.
Створити модуль Validation з одним методом phone_valid?, який буде перевіряти, чи значення аргумента, який йому передається, знаходиться в форматі +38dddddddddd, де d - будь-яка цифра. 
Якщо це так, то метод phone_valid повертає значення істини, інакше - значення хибно.
Створити клас User з двома змінними класу - name та phone.
Змінна name ініціалізується в конструкторі та має атрибут-гетер.
Змінна phone має атрибут-сетер, але при наданні значення цій змінній повинна відбуватися перевірка з модуля Validation. 
Якщо значення, що ми хочемо присвоїти цій змінній, невалідне, то генерується виключення PhoneFormatException із аргументом, що дорівнює цьому невірному значенню. 
Інкаше змінній phone надається це значення.

user = User.new('Name')
user.phone = '80678765567' - буде генерувати виключення з повідомленням Phone number 80678765567 incorrect. You should enter phone in format +38dddddddddd 
"""

module Validation
    def phone_valid?(phone_number)
        pattern = /(\+38)(\d{10,10})/
        
        if pattern.match(phone_number) && phone_number.length == 13
            return true
        else
            return false
        end
    end
end

class PhoneFormatException < StandardError
    def initialize(phone_number)
        @phone = phone_number
    end

    def to_s
        "Phone number #{@phone} is incorrect. You should enter phone in format +38dddddddddd"
    end
end
    
    
class User
    include Validation 

    attr_reader :name
    
    def initialize(name)
        @name = name
    end
    
    def phone=(number)
        if phone_valid?(number)
            @phone = number
        else
            raise PhoneFormatException, number
            return false
        end
    end
end