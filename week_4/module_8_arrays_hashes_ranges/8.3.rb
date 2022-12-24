"""
Нехай задано двовимірний масив – квадратну матрицю (розмір 3х3 мінімум). 
Обчислити суму елементів головної діагоналі, елементів під головною діагоналлю, елементів над головною діагоналлю. 
Результат повернути у вигляді хешу наступного вигляду {“m” => 10, “u” => 20, “o” => 30}, 
де m – сума елементів головної діагоналі, u, o – елементів під головною діагоналлю і над головною діагоналлю відповідно
"""

def matrix_params(arr)
    result = {'m' => 0, 'u' => 0, 'o' => 0}
  
    (arr.length).times do |num_index|
      # count diagonal in matrix
      result['m'] += arr[num_index][num_index]
        
      # count every element in sub array after diagonal item in eah sub array
      for k in (0...num_index)
        result['o'] += (arr[num_index])[k]
      end
  
      # count every element in sub array before diagonal item in eah sub array
      for j in ((num_index + 1)...(arr[num_index]).length)
        result['u'] += (arr[num_index])[j]
      end
    end
    
    result
  end
