"""
Створити метод check_password з двома аргументами. 
Цей метод має повертати proc, який буде перевіряти, чи передані йому аргументи співпадають з двома аргументами методу. 
Якщо вони рівні, то proc повертає true, інакше повертає false.
"""

def check_password(arg_1, arg_2)
    proc { |proc_arg_1, proc_arg_2| [proc_arg_1, proc_arg_2] == [arg_1, arg_2] }
end
  