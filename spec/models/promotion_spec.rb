require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe 'validations' do
    it do
      expect(Promotion.new()).to_not be_valid
    end

    it do
      nightclub = create(:nightclub)
      expect(Promotion.new(description: 'Some promo', nightclub: nightclub)).to be_valid
    end
  end

  describe 'scopes' do
    it 'has an active scope' do
      nightclub = create(:nightclub)
      Promotion.create(nightclub: nightclub, active: true)
      Promotion.create(nightclub: nightclub, active: false)
      expect(Promotion.count).to be 1
    end
  end
end
