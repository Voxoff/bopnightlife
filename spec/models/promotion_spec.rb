require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe 'validations' do
    before do
      nightclub = build(:nightclub)
    end
    it do
      expect(Promotion.new()).to_not be_valid
    end

    it do
      expect(Promotion.new(description: 'Some promo', nightclub: nightclub)).to be_valid
    end

  end
end
