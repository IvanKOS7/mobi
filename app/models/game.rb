class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team", foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: "Team", foreign_key: 'away_team_id'

  has_many :game_events, dependent: :destroy

  # exclude repetition of one command
  
  validates :home_team, exclusion: { in: ->(g) { [ g.away_team ] } }

  # отметить, что игрок выполнил такой-то показатель в матче
  # goals, :goal_assists, :mileage

  def complete_events
    achievements = game_events.map { |event| event.complete }
  end
end
