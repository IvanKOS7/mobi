require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    it { should belong_to(:away_team) }
    it { should belong_to(:home_team) }
    it { should have_many(:game_events) }
  end
end
