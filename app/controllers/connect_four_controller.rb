class ConnectFourController < ApplicationController
  WIN_COUNT = 4
  ROW_COUNT = 6
  COLUMN_COUNT = 7

  def create_game
    game_state = GameState.new(
      next_player: 1,
      winner: nil,
      board: BoardHandler.create_board(ROW_COUNT, COLUMN_COUNT),
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
    row = BoardHandler.put_piece(board, player, column)

    if row
      game_state.next_player = (player == 1) ? 2 : 1
      game_state.winner = player if BoardHandler.winner?(WIN_COUNT, board, player, row, column)

      game_state.save

      render json: game_state
    end
  end
end
