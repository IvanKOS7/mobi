class GameEvent < ApplicationRecord
  belongs_to :player
  belongs_to :game

  # uniq combi games attr ids
  
  validates :player_id, presence: true, uniqueness: { scope: :game_id }

  def compare_with_achieve
    achieve = Achievement.where(event: event)
    player.achievements << achieve if achieve.count <= count
  end
end
