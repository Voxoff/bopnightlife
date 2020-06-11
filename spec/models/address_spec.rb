require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { build(:address) }

  describe '#to_s' do
    it 'concatenates address' do
      expect(subject.to_s).to eq "Am Wauss, OX22"
    end
  end
end
