class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :home_team_id, foreign_key: true
      t.integer :away_team_id, foreign_key: true

      t.timestamps
    end
  end
end
