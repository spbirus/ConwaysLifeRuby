# There are three methods and the "main" execution at the bottom to do.
# I have marked the locations to fill in with TODO tags.
# I recommend tackling these in order - I have numbered them in the
# order I recommend working on them.
# Remember you can use irb to test out your methods and try out syntax!

# Print the array to the screen, with x representing a living
# cell and . representing a dead cell.
# Finish the printing with a single line of asterisks, exactly
# as long as the array is wide.
# There is no need to return anything
# Example:
# ...........
# ...........
# ...........
# ...........
# ...........
# ...........
# .........x.
# ........x.x
# .......x..x
# ........xx.
# ...........
# ***********

def print_arr(arr)
  # TODO 1
  (0...arr.length).each do |x|
    (0...arr.length).each do |y|
      print arr[x][y]
      print " "
    end
    print "\n"
  end
end

# Should return the # of living neighbors of cell in location x, y
# in array arr (i.e., this will return a value between 0 - no living
# neighbors and 8 - every cell around this cell is living)

def num_neighbors(x, y, arr)
  # TODO 2
  neighbors = 0

  if arr[x%arr.length][(y+1)%arr.length] == "X"
    #up
    neighbors+=1
  end
  if arr[(x+1)%arr.length][(y+1)%arr.length] == "X"
    #right up
    neighbors+=1
  end
  if arr[(x+1)%arr.length][y%arr.length] == "X"
    #right
    neighbors+=1
  end
  if arr[(x+1)%arr.length][(y-1)%arr.length] == "X"
    #right down
    neighbors+=1
  end
  if arr[x%arr.length][(y-1)%arr.length] == "X"
    #down
    neighbors+=1
  end
  if arr[(x-1)%arr.length][(y-1)%arr.length] == "X"
    #left down
    neighbors+=1
  end
  if arr[(x-1)%arr.length][y%arr.length] == "X"
    #left
    neighbors+=1
  end
  if arr[(x-1)%arr.length][(y+1)%arr.length] == "X"
    #left up
    neighbors+=1
  end

  # neighbors
end

# Should perform one iteration of Conway's game of life, as
# described in exercise1.md

def iterate(arr)
  # TODO 3
  arrNew = []
  (0...arr.count).each do |x|
    arrNew[x] = []
    (0...arr.count).each do |y|
      if num_neighbors(x, y, arr) == 3
        arrNew[x][y] = "X"
      else
        arrNew[x][y] = "."
      end
    end
  end

  arrNew
end

# Given a pseudorandom number generator, a size, and a percentage
# of cells to be alive, make a size x size array (e.g., a 10 x 10 array
# if size = 10), and randomly assign percent % of them to be living.
# Return the newly created array to the caller.

def create_arr(prng, size, percent)
  arr = []
  (0...size).each do |x|
    arr[x] = []
    (0...size).each do |y|
      if prng.rand(101) <= percent
        arr[x][y] = "X"
      else
        arr[x][y] = "."
      end
    end
  end
  arr
end


# EXECUTION STARTS HERE

# TODO 4

raise "Enter integers for size, percentage (1..100), and number of iterations at command line" unless ARGV.count == 3
size, percent, iters = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

# All of these can be done
# If size is not >0, inform the user and exit
if size <= 0
  puts "You entered a size that is not greater than 0"
  exit
end

# If percent is not an integer between 0 and 100, inform the user and exit
if percent < 0 || percent >100
  puts "You entered a percent that is not between 0 and 100"
end

# If number of iterations is not an integer that is 0 or greater, inform the user and exit
if iters < 0
  puts "You entered an interation that is not greater than 0"
end

# Create the array and assign it a new array from the create_array method
# arr = Array.new(size)
prng1 = Random.new
arr1 = create_arr(prng1, size, percent)
puts("print starting array")
print_arr(arr1)

# puts num_neighbors(9,0,arr1)

# Iterate for _iters_ iterations

(0...iters).each do |i|
  arr1 = iterate(arr1)
  puts("print array iteration" + (i+1).to_s)
  print_arr(arr1)
end
