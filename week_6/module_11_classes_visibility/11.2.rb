"""
Написати клас Site, в якому буде константа HOME_URL, яка дорівнює 'https://www.home.com'.
В цьому класі повинна бути змінна path, що буде відображати всі шляхи, по яким відбувався перехід (історія переходів по сторінках) для всіх екземплярів класу Site.
У змінній current_url буде знаходитися рядок, що показує адресу сайта, де ми зараз знаходимося.
До цієї змінної є доступ тільки для читання (по відповідному атрибуту).
Для переходу за певною адресою є метод go_to, аргументом якого є відносний (відносно home сторінки) шлях. Якщо цей аргумент дорівнює поточному шляху, то нічого не змінюється (ми залишаємося на тій же сторінці). Інакше - змінюється адреса поточного шляху та в історію переходів додається повний шлях.
Перевизначити оператори більше, менше, дорівнює, не дорівнює за такими правилами:
    Меншим вважається той екземпляр класу, перша згадка про current_url якого в історії переходів буде раніше.
    Більшим, відповідно, вважається той екземпляр класу, перша згадка про current_url якого в загальній історії буде пізніше.
    Рівними вважаються екземпляри, в яких однаковий current_url. Відповідно, якщо різні current_url, то такі екземпляри не рівні між собою.
"""

class Site
    HOME_URL = 'https://www.home.com'
    @@path = []
    
    attr_reader :current_url
    
    def initialize
        @current_url = HOME_URL
        @@path.append(@current_url)
    end
    
    def go_to(url)
        unless @current_url == "#{HOME_URL}/#{url}"
            @current_url = "#{HOME_URL}/#{url}" 
            @@path.append(@current_url)
        end
    end
    
    def <(other)
        @@path.index(current_url) < @@path.index(other.current_url)
    end
    
    def >(other)
        @@path.index(current_url) > @@path.index(other.current_url)
    end
    
    def ==(other)
        current_url == other.current_url
    end
    
    def !=(other)
        current_url != other.current_url
    end
    
    def to_s
         "*----------*\n home: #{HOME_URL}\n current url: #{current_url}\n history: #{@@path}\n*----------*"
    end
end
