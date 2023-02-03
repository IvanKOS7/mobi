require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'associations and validates ' do
    it { should have_many(:away_games).through(:team) }
    it { should have_many(:home_games).through(:team) }
    it { should have_many(:game_events).dependent(:destroy) }
    it { should have_and_belong_to_many(:achievements) }
  end

  describe 'validations' do
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :first_name }
  end
end
