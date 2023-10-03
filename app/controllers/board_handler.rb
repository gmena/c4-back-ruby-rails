class BoardHandler

  def self.create_board(row_count, column_count)
    Array.new(row_count) { Array.new(column_count, 0) }
  end

  def self.put_piece(board, player, column)
    (board.size - 1).downto(0).each do |row|
      if board[row][column] == 0
        board[row][column] = player
        return row
      end
    end
    nil
  end

  def self.winner?(win_count, board, player, row, column)
    winner_horizontal?(win_count, board, player, row, column) ||
    winner_vertical?(win_count, board, player, row, column) ||
    winner_diagonal?(win_count, board, player, row, column) ||
    winner_reverse_diagonal?(win_count, board, player, row, column)
  end

  def self.winner_horizontal?(win_count, board, player, row, column)
    winner_by_deltas?(win_count, 0, 1, board, player, row, column)
  end

  def self.winner_vertical?(win_count, board, player, row, column)
    winner_by_deltas?(win_count, 1, 0, board, player, row, column)
  end

  def self.winner_diagonal?(win_count, board, player, row, column)
    winner_by_deltas?(win_count, -1, 1, board, player, row, column)
  end

  def self.winner_reverse_diagonal?(win_count, board, player, row, column)
    winner_by_deltas?(win_count, 1, 1, board, player, row, column)
  end

  def self.winner_by_deltas?(win_count, delta_y, delta_x, board, player, row, column)
    height = board.size
    width = board.first.size
    max = [height, width].max - 1

    n = 0
    (-max .. max).each do |i|
      y = row + (i * delta_y)
      x = column + (i * delta_x)
      
      next if (y < 0) || (y >= height) || (x < 0) || (x >= width)

      if board[y][x] == player
        n += 1
        return true if n == win_count
      else
        n = 0
      end
    end

    false
  end
end
