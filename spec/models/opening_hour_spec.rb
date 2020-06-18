require 'rails_helper'

RSpec.describe OpeningHour, type: :model do
  subject { create(:opening_hour) }

  describe '#day_of_week' do
    # messy codes makes for messy tests
    it 'routes to correct day' do
      expect(subject).to receive(:monday)
      subject.day_of_week(0)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:tuesday)
      subject.day_of_week(1)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:wednesday)
      subject.day_of_week(2)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:thursday)
      subject.day_of_week(3)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:friday)
      subject.day_of_week(4)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:saturday)
      subject.day_of_week(5)
    end

    it 'routes to correct day' do
      expect(subject).to receive(:sunday)
      subject.day_of_week(6)
    end
  end
end
