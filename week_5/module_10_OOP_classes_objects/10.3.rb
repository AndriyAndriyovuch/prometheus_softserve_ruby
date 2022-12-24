"""
Написати клас Pizza.
Кожна піца буде характеризуватися своїм набором інгредієнтів (просто рядок з назвою інгредієнта), діагоналлю та номером замовлення. Цей набір повинен зберігатися у змінній ingredients.
Кожній піці при створенні дається унікальний номер, який зберігається у змінній number (для цього треба створити змінну класу count, в яку записувати кількість створених з коректною діагоналлю екземплярів і використати її для цього номеру).
Діагональ зберігається у змінній d. Діагональ піци може бути тільки 25 або 50. Якщо діагональ не дорівнює одному з цих значень, то створюється “порожня” піца. Список інгредієнтів має бути порожнім. Номер піци дорівнювати нулю. Діагональ також дорівнює нулю.
Написати метод класу failInstance, який би повертав кількість невдалих спроб створення екземпляів класу Pizza (тих, в яких діагональ не дорівнює 25 або 50).
"""

class Pizza
    @@count = 0
    @@failed_pizza = 0

    attr_accessor :ingredients, :d, :number

    def check_diagonal
        unless @d == 25 || @d == 50
            @d = 0
            @ingredients = []
            @number = 0
            @@count > 0? @@count -= 1: @@count = 0
            @@failed_pizza += 1
        end
    end

    def initialize(diagonal, ingredients)
        @@count += 1
        @d = diagonal
        @ingredients = ingredients
        @number = @@count

        check_diagonal
    end

    def self.failInstance
        @@failed_pizza
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
