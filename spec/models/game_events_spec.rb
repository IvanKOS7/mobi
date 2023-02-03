require 'rails_helper'

RSpec.describe GameEvent, type: :model do
  describe 'associations and validates ' do
    it { should belong_to(:player) }
    it { should belong_to(:game) }
  end

  describe 'validations' do
    GameEvent.create(player_id: 1, game_id: 1)
    it { should validate_presence_of :player_id }
    it { should validate_uniqueness_of(:player_id).scoped_to(:game_id) }
  end
end
