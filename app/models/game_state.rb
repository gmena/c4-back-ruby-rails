class GameState < ApplicationRecord
  serialize :board, Array

  def as_json(options)
    {
      id: id,
      nextPlayer: next_player,
      winner: winner,
      board: board,
    }
  end
end
