require 'rails_helper'

RSpec.describe OpeningHour, type: :model do
  subject { create(:opening_hour) }

  describe '#day_of_week' do
    it 'routes to correct day' do

      # expect(subject).to receive(:monday)
      # subject.day_of_week(0)
    end
  end
end
