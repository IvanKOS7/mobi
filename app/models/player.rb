class Player < ApplicationRecord
  belongs_to :team

  has_many :home_games, through: :team
  has_many :away_games, through: :team
  has_many :game_events, dependent: :destroy

  has_and_belongs_to_many :achievements

  validates :first_name, :last_name, presence: true

  # проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды

  def complete_achieve_for_five_games?(achieve)
    game_events.first(5).any? { |event| achieve.matches?(event) }
  end

  def self.top_five_players(achieve, team_id)
    Team.find(team_id).players.joins(:game_events).merge(GameEvent.where(event: achieve.event).order(count: :desc)).first(5)
  end

  def self.top_world_five_players(achieve)
    Player.all.joins(:game_events).merge(GameEvent.where(event: achieve.event).order(count: :desc)).first(5)
  end
end
