content = File.read('input-04.txt')

def count_horizontal(grid, word)
  grid.sum do |row|
    row_string = row.is_a?(String) ? row : row.join
    row_string.scan(word).count
  end
end

# Extract all diagonals from top-left to bottom-right
def diagonals_top_left(grid)
  diagonals = []
  n = grid.size
  m = grid[0].size

  # Diagonals starting from the top row
  (0...m).each do |col|
    diagonal = []
    x, y = 0, col
    while x < n && y < m
      diagonal << grid[x][y]
      x += 1
      y += 1
    end
    diagonals << diagonal
  end

  # Diagonals starting from the leftmost column
  (1...n).each do |row|
    diagonal = []
    x, y = row, 0
    while x < n && y < m
      diagonal << grid[x][y]
      x += 1
      y += 1
    end
    diagonals << diagonal
  end

  diagonals
end

# Extract all diagonals from top-right to bottom-left
def diagonals_top_right(grid)
  diagonals = []
  n = grid.size
  m = grid[0].size

  # Diagonals starting from the top row
  (0...m).each do |col|
    diagonal = []
    x, y = 0, col
    while x < n && y >= 0
      diagonal << grid[x][y]
      x += 1
      y -= 1
    end
    diagonals << diagonal
  end

  # Diagonals starting from the rightmost column
  (1...n).each do |row|
    diagonal = []
    x, y = row, m - 1
    while x < n && y >= 0
      diagonal << grid[x][y]
      x += 1
      y -= 1
    end
    diagonals << diagonal
  end

  diagonals
end

def count_word_occurences(char_grid, word)
  count = 0

  count += count_horizontal(char_grid, word)
  count += count_horizontal(char_grid.map(&:reverse), word)

  rotated_char_grid = char_grid.transpose
  count += count_horizontal(rotated_char_grid, word)
  count += count_horizontal(rotated_char_grid.map(&:reverse), word)

  diagonals = diagonals_top_left(char_grid) + diagonals_top_right(char_grid)
  count += count_horizontal(diagonals, word)

  rotated_diagonals = diagonals.map(&:reverse)
  count += count_horizontal(rotated_diagonals, word)

  count
end

content_array = content.split("\n").map(&:chars)

def count_part_one()
  word = 'XMAS'

  counted = count_word_occurences(content_array, word)
  puts counted
end

count_part_one()
