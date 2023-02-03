require 'rails_helper'
require 'logger'

describe 'Functionality', type: :request do

  let(:first_team) { create(:team) }
  let(:second_team) { create(:team) }
  let(:first_player) { create(:player, team: first_team) }
  let(:second_player) { create(:player, team: second_team) }

  let(:game) { create(:game, home_team: first_team, away_team: second_team) }
  let!(:game_event) { create(:game_event, player: first_player, game: game) }
  let!(:achievement) { create(:achievement) }

  describe 'Player has completed the achievement' do
    before do
      game.game_events.push(game_event)
      game.complete_events
    end

    it 'Player get achieve' do
     #debugger
      expect(first_player.achievements).to include(achievement)
    end

    it 'Player has completed one achievement in 5 matches' do
      expect(first_player.complete_achieve_for_five_games?(achievement)).to eq(true)
      expect(second_player.complete_achieve_for_five_games?(achievement)).to eq(false)
    end

    it 'top 5 players' do
      #debugger
      expect(Player.top_five_players(achievement, first_team.id)).to eq([first_player])
      expect(Player.top_five_players(achievement, second_team.id)).to eq([])
    end
  end
end
