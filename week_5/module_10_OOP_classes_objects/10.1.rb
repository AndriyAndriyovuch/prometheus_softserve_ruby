"""
Написати клас Pizza. Кожна піца буде характеризуватися своїм набором інгредієнтів 
(інгредієнт - це просто рядок з назвою, набір інгредієнтів - масив рядків) та номером замовлення.

Цей набір інгредієнтів повинен зберігатися у змінній ingredients.

Кожній піці при створенні дається унікальний номер (для цього треба створити змінну класу count, 
    в яку записувати кількість створених екземплярів класу Pizza і використати її для формування цього номеру). 
    Номер повинен зберігатися у змінній екземпляру number.

Написати метод description, який виводив би у консоль інформацію про піцу у вигляді
"""

class Pizza
    @@count = 0

    attr_accessor :ingredients

    def initialize(ingredients)
        @@count += 1
        @ingredients = ingredients
        @number = @@count
    end

    def description
        if @ingredients.is_a?(Array)
            ingredients_array = "[" + @ingredients.join(',') + "]"
            print "Піца № #{@number} містить #{ingredients_array}."
        else
            print "Піца № #{@number} містить #{@ingredients}."
        end
    end
end