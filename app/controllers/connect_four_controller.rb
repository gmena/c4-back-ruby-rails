class ConnectFourController < ApplicationController
  ROWS = 6
  COLS = 7

  def create_game
    game_state = GameState.new(
      next_player: 1,
      winner: nil,
      board: Array.new(ROWS) { Array.new(COLS, 0) },
    )
    game_state.save

    render json: game_state
  end

  def get_game
    game_state = GameState.find(params[:id])

    render json: game_state
  end

  def put_piece
    game_state = GameState.find(params[:id])
    player = params[:player].to_i
    column = params[:column].to_i

    board = game_state.board
    row = (board.size - 1).downto(0).find do |r|
      board[r][column] == 0
    end

    if row
      board[row][column] = player
      game_state.next_player = (player == 1) ? 2 : 1
      game_state.save

      render json: game_state
    end
  end
end
