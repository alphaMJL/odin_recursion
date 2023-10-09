# on input of n elements
#   if n < 2
#     return
#   else
#     sort left half of elements
#     sort right half of elements
#     merge sorted halves

#divide A[1..n] into A[1..n/2] and A[n/2+1..n]

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid = (array.length/2).floor
    left = merge_sort(array[0..mid - 1])
    right = merge_sort(array[mid..-1])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

p merge_sort([4,7,4,8,9,0,3,5,6,34,3,6,7,5,4])