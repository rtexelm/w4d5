require 'byebug'

def my_min(arr) # O(n^2)
  smallest = arr.first # O(1)
  arr.each_with_index do |ele1, i| # O(n)
    arr.each_with_index do |ele2, j| # O(n)
      if j > i && ele2 < ele1 # O(1)
        smallest = ele2 # O(1)
      end
    end
    return smallest
  end
  
end

# p my_min([0,3,5,4,-5,10,1,90])

def my_min_faster(arr)
  arr.inject {|acc, ele| ele < acc ? ele : acc} # O(n)
end

# p my_min_faster([0,3,5,4,-5,10,1,90])

# arr.drop(i).inject

# def largest_contiguous_subsum(arr) #O(n^3)
#   combo_arr = [] # O(1)
#   (0...arr.length).each do |i| # O(n)
#     (i...arr.length).each do |j| # O(n)
#       combo_arr << arr[i..j] # O(1)
#     end
#   end
#   max_sum = combo_arr.map { |sub| sub.sum }.max # O(n)
#   # longest = combo_arr.inject do |acc, sub|
#   #   if acc.sum > sub.sum
#   #     acc
#   #   else
#   #     sub
#   #   end
#   # end
#   # longest.sum
# end

def largest_contiguous_subsum(arr)
  debugger
  largest = arr.first
  current = arr.first 
  (1...arr.length).each do |i| # -6
    if current < 0
      current = 0
    end
    current += arr[i] # -1
    largest = current if current > largest #5
  end
  largest
end

# p largest_contiguous_subsum([-6, 9, -4, 2, 8, -10, 3, 9])

def first_anagram?(first_str, second_str)
  chars_first_str = first_str.chars
  perms = permutations(chars_first_str)

  perms.each do |str_combo|
    if second_str == str_combo.join
      return true
    end
    
  end
  return false

end

def permutations(array) # O(n!)
  return [array] if array.length <= 1

  perms_without_first = permutations(array.drop(1))

  perms_without_first.inject([]) do |all_perms, perm|
    all_perms + (0..perm.size).map do |i| 
      perm.take(i) + [array.first] + perm.drop(i)
    end
  end
end

# p first_anagram?('gizmo','sally')
# p first_anagram?('elivs','lives')


def second_anagram?(first_str, second_str)
  first_chars_arr = first_str.chars
  second_chars_arr = second_str.chars

  first_chars_arr.each do |char|
    ss_index = second_chars_arr.find_index(char)
    if ss_index != nil
      second_chars_arr.delete_at ss_index
    end
  end

  second_chars_arr.empty?

end

p second_anagram?('elivs','lives')
p second_anagram?('gizmo','sally')
