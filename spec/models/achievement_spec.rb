require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:players) }
  end
end
