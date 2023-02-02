class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team", foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: "Team", foreign_key: 'away_team_id'

  # exclude repetition of one command
  validates :home_team, exclusion: { in: ->(g) { [ g.away_team ] } }

end
