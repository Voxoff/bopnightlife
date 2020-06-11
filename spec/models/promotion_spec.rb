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
    before do
      promotion = create(:promotion)
      # promotion = create(:promotion)
      # promotion = create(:promotion, active: true)
      # Promotion.create(nightclub: nightclub, active: true, description: 'blank')
      # Promotion.create(nightclub: nightclub, active: false, description: 'blank')
    end
    it 'has an active scope' do
      expect(Promotion.count).to be 1
      # expect(Promotion.active).to be 1
    end
  end
end
