class Team < ApplicationRecord
  has_many :players

  has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_team_id'

  scope :top_five_team_players, ->(param) { PlayerStatistic("#{param}": :desc).first(5) }

  def games
    home_games + away_games
  end
end
