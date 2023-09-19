class CreateGameStates < ActiveRecord::Migration[7.0]
  def change
    create_table :game_states do |t|
      t.integer :next_player
      t.integer :winner
      t.string :board

      t.timestamps
    end
  end
end
