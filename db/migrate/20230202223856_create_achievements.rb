class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :event
      t.integer :count

      t.timestamps
    end
  end
end
