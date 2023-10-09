# Using iteration starting from 0. Returns the whole sequence
def fibs(num)
  array = [0, 1]
  if num == 0 
    [0]  
  elsif num == 1
    array 
  else
    count = 2
    while count < num do
      array.push(array[-1,] + array[-2])
      count += 1
    end
    array
  end
end

# Using recursion

# This returns the nth number
#

def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

def make_array
  
end
