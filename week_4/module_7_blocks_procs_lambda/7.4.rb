"""
Створити метод m1, який би повертав блок, якщо він буде виконуватися з блоком; 
і рядок "Method without block", якщо цей метод виконується без блоку. 
"""

def m1(&block)
    return "Method without block" unless block
    return block
end