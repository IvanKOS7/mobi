class Player < ApplicationRecord
  belongs_to :team

  has_many :home_games, through: :team
  has_many :away_games, through: :team

  def games
    home_games + away_games
  end
end
