require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe 'validations' do
    it do
      expect(Promotion.new()).to_not be_valid
    end

    it do
      expect(Promotion.new(description: 'Some promo')).to be_valid
    end

  end
end
