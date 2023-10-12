def shortest_knight_path(start, target)
  moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-1, 2], [-2, 1]]
  chessboard_size = 8

  queue = [start]
  visited = {start => nil}

  while !queue.empty?
    current = queue.shift

    return reconstruct_path(visited, start, target) if current == target

    moves.each do |move|
      next_x = current[0] + move[0]
      next_y = current[1] + move[1]
      next_square = [next_x, next_y]

      if valid_move?(next_square, chessboard_size) && !visited.include?(next_square)
        queue << next_square
        visited[next_square] = current
        p visited
      end
    end
  end

  return nil  # No path found
end

def valid_move?(square, chessboard_size)
  square.all? { |coord| coord >= 0 && coord < chessboard_size }
end

def reconstruct_path(visited, start, target)
  current = target
  path = []

  while current
    path.unshift(current)
    current = visited[current]
  end

  path
end

# Example usage
start_square = [0, 0]
target_square = [3, 3]
path = shortest_knight_path(start_square, target_square)

puts "Shortest path: #{path}"
