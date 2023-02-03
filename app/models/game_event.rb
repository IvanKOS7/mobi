class GameEvent < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player_id, presence: true, uniqueness: { scope: :game_id }

  def self.top_five_world_players(param)
    Player.joins(:player_statistic).merge(PlayerStatistic.order(param: :desc).first(5))
  end

  def compare_with_achieve
    achieve = Achievement.where(event: event)
    player.achievements << achieve if achieve.count <= count
  end
end
