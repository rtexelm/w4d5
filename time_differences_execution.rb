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

# p my_min([0,3,5,4,-5,10,1,90])

def my_min_faster(arr)
  arr.inject {|acc, ele| ele < acc ? ele : acc}
end

p my_min_faster([0,3,5,4,-5,10,1,90])

# arr.drop(i).inject

def largest_contiguous_subsum(arr)
  combo_arr = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      combo_arr << arr[i..j]
    end
  end
  longest = combo_arr.inject do |acc, sub|
    if acc.sum > sub.sum
      acc
    else
      sub
    end
  end
  longest.sum
end

p largest_contiguous_subsum([-5, -1, -3])