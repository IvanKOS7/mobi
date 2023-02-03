class CreateGameEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :game_events do |t|
      t.string :event
      t.integer :count
      t.belongs_to :player, foreign_key: true
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end
