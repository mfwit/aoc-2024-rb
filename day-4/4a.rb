$count = 0

def checkHorz(grid, y, x)
  # Check forward
  if grid[y][x+1] == "M" && grid[y][x+2] == "A" && grid[y][x+3] == "S"
    $count += 1
    puts "horz forward: #{y}, #{x} "
  end
  # Check backward
  if x-3 < 0 || grid[y][x-1] == "M" && grid[y][x-2] == "A" && grid[y][x-3] == "S"
    $count += 1
    puts "horz backward: #{y}, #{x} "
  end
end

def checkVert(grid, y, x)
  # Check down
  unless grid[y+1].nil? || grid[y+2].nil? || grid[y+3].nil?
    if grid[y+1][x] == "M" && grid[y+2][x] == "A" && grid[y+3][x] == "S"
      $count += 1
      puts "vert down: #{y}, #{x} "
    end
  end
  # Check up
  unless grid[y-1].nil? || grid[y-2].nil? || grid[y-3].nil?
    if grid[y-1][x] == "M" && grid[y-2][x] == "A" && grid[y-3][x] == "S"
      $count += 1
      puts "vert up: #{y}, #{x} "
    end
  end
end

def checkDiag(grid, y, x)
  # Check up right diagonal
  unless grid[y-1].nil? || grid[y-2].nil? || grid[y-3].nil?
    if grid[y-1][x+1] == "M" && grid[y-2][x+2] == "A" && grid[y-3][x+3] == "S"
      $count += 1
      puts "diag up right: #{y}, #{x} "
    end
  end
  # Check up left diagonal
  unless x-3 < 0 || grid[y-1].nil? || grid[y-2].nil? || grid[y-3].nil?
    if grid[y-1][x-1] == "M" && grid[y-2][x-2] == "A" && grid[y-3][x-3] == "S"
      $count += 1
      puts "diag up left: #{y}, #{x} "
    end
  end
  # Check down right diagonal
  unless grid[y+1].nil? || grid[y+2].nil? || grid[y+3].nil?
    if grid[y+1][x+1] == "M" && grid[y+2][x+2] == "A" && grid[y+3][x+3] == "S"
      $count += 1
      puts "diag down right: #{y}, #{x} "
    end
  end
  # Check down left diagonal
  unless x-3 < 0 || grid[y+1].nil? || grid[y+2].nil? || grid[y+3].nil?
    if grid[y+1][x-1] == "M" && grid[y+2][x-2] == "A" && grid[y+3][x-3] == "S"
      $count += 1
      puts "diag down left: #{y}, #{x} "
    end
  end
end

grid = []

input = File.open('input').read
input.split("\n").each do |row|
  grid << row.split("")
end
grid.each_with_index do |row, y|
  row.each_with_index do |item, x|
    if item == "X"
      checkHorz(grid, y, x)
      checkDiag(grid, y, x)
      checkVert(grid, y, x)
    end
  end
end

puts $count