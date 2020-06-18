require 'rails_helper'

RSpec.describe Promotion, type: :model do
  # describe 'validations' do
  #   it do
  #     expect(Promotion.new()).to_not be_valid
  #   end

  #   it do
  #     nightclub = create(:nightclub)
  #     expect(Promotion.new(description: 'Some promo', nightclub: nightclub)).to be_valid
  #   end
  # end

  describe 'scopes' do
    describe '#active' do
      before do
        # within factory bot DSL?
        Promotion.destroy_all
        create(:promotion)
        create(:promotion, active: false, description: 'blank')
      end

      it 'has an active scope' do
        active = create(:promotion, active: true, description: 'blank')
        expect(Promotion.count).to be 3
        expect(Promotion.active).to match_array [active]
      end
    end
  end
end
