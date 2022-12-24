"""
Написати клас Site, в якому буде константа HOME_URL, яка дорівнює 'https://www.home.com'.
У змінній current_url буде знаходитися рядок, що показує адресу сайта, де ми зараз перебуваємо. 
На початку (при створенні екземпляру класу) ця змінна дорівнює HOME_URL.
Для отримання значення змінної current_url є відповідний атрибут.
Для переходу за певною адресою є метод go_to, аргументом якого є відносний (відносно home сторінки) шлях. 
Якщо цей аргумент дорівнює поточному шляху, то нічого не відбувається (ми залишаємося на тій же сторінці), 
інакше - відбувається зміна поточної адреси та метод повертає цю змінену адресу
"""

class Site
    HOME_URL = 'https://www.home.com'
    
    attr_reader :current_url
    
    def initialize
        @current_url = HOME_URL
    end
    
    def go_to(url)
        @current_url = "#{HOME_URL}/#{url}" unless @current_url == "#{HOME_URL}/#{url}"
    end
    
    def to_s
         "*----------*\n home: #{HOME_URL}\n current url: #{current_url}\n*----------*"
    end
end
    