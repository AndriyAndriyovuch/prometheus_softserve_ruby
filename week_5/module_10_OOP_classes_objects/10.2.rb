"""
Написати клас Pizza. Кожна піца буде характеризуватися своїм набором інгредієнтів, діагоналлю та номером замовлення.
Цей набір повинен зберігатися у змінній ingredients.
Діагональ зберігається у змінній d. Діагональ піци може бути тільки 25 або 50. 
Якщо діагональ не дорівнює одному з цих значень, то піца створюється із значеннями всіх змінних рівними нулю, та порожнім масивом інгредієнтів.
Кожній піці при створенні дається унікальний номер, який зберігається у змінній number 
(для цього треба створити змінну класу count, в яку записувати кількість створених з коректною діагоналлю екземплярів і використати її для цього номеру).
Написати метод description, який повертав би рядкове представлення піци у вигляді
"""

class Pizza
    @@count = 0

    attr_accessor :ingredients, :d, :number

    def check_diagonal
        unless @d == 25 || @d == 50
            @d = 0
            @ingredients = []
            @number = 0
            @@count > 0? @@count -= 1: @@count = 0
        end
    end

    def initialize(diagonal, ingredients)
        @@count += 1
        @d = diagonal
        @ingredients = ingredients
        @number = @@count

        check_diagonal
    end

    def description
        if @ingredients.is_a?(Array)
            ingredients_array = "[" + @ingredients.join(',') + "]"
            print "Піца № #{@number} (діагональ = #{@d}) містить #{ingredients_array}."
        else
            print "Піца № #{@number} (діагональ = #{@d}) містить #{@ingredients}."
        end
    end
end
