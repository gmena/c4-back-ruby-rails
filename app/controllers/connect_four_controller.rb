class ConnectFourController < ApplicationController
  ROWS = 6
  COLS = 7

  def create
    game_state = GameState.new(
      next_player: 1,
      winner: nil,
      board: Array.new(ROWS) { Array.new(COLS, 0) },
    )
    game_state.save

    render json: game_state
  end
end
