class CreateJoinTablePlayerAchievements < ActiveRecord::Migration[7.0]
  def change
    create_join_table :players, :achievements do |t|
      t.index [:player_id, :achievement_id]
      t.index [:achievement_id, :player_id]
    end
  end
end
