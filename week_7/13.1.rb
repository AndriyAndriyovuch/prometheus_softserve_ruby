"""
Написати метод sqrt, який буде повертати корінь квадратний з аргумента, що передається цьому методу, 
заокруглений до чотирьох знаків після коми (заокруглення можна робити за допомогою методу round) у випадку, якщо цей аргумент - невід'ємне число.

У випадку, якщо аргумент - від'ємне число, генерувати StandardError виключення з повідомленням 
"The root of a negative number does not exist in rational numbers"
"""

def sqrt(num)
    raise StandardError, "The root of a negative number does not exist in rational numbers" if num < 0
    (num ** 0.5).round(4)   
end
