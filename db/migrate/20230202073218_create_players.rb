class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
