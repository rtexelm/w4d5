def my_min(arr)
  smallest = arr.first
  arr.each_with_index do |ele1, i|
    arr.each_with_index do |ele2, j|
      if j > i && ele2 < ele1
        smallest = ele2
      end
    end
    return smallest
  end
  
end

p my_min([0,3,5,4,-5,10,1,90])