require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it do
      should have_many(:players)
    end
    # it { should have_many(:home_games) }
    # it { should have_many(:away_games) }
  end

  describe 'validations' do
    # subject { build(:team) }

    #it { should validate_presence_of :name }
  end
end
