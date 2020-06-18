require 'rails_helper'

RSpec.describe Nightclub, type: :model do
  describe do

  end

  subject { build(:nightclub, params) }
  let(:params) { { } }

  describe '#gender_mix_string' do
    let(:params) { {  gender_mix: 20 } }
    it 'should return field with %' do
      expect(subject.gender_mix_string).to eq "20%"
    end
  end

  xdescribe '#current_capacity_string' do
    let(:params) { {  current_capacity: 20 } }

    it 'should return field with %' do
      expect(subject.current_capacity_string).to eq "20%"
    end
  end

  xdescribe '#capacity_percentage_string' do
    let(:params) { {  capacity_percentage: 20 } }

    it 'should return field with %' do
      expect(subject.capacity_percentage_string).to eq
    end
  end

  describe '#queue_time_string' do
    let(:params) { {  queue_time: 20 } }
    it 'should return field with %' do
      expect(subject.queue_time_string).to eq "20 mins"
    end

    context 'when no queue_time is present'do
      let(:params) { { queue_time: nil } }
      it 'should return ?' do
        expect(subject.queue_time_string).to eq "?"
      end
    end
  end

  describe '#live_data?' do
    context 'no live data provided' do
      let(:params) { { queue_time: nil, gender_mix: nil, capacity_percentage: nil}}
      it 'should return false' do
        expect(subject.live_data?).to eq false
      end
    end
  end

  xdescribe '#recently_updated?' do
    before do
      Timecop.travel(Time.now - 15.minutes.ago) {
        @nightclub = create(:nightclub)
      }
    end
    it 'is true if updated less than 10 mins ago' do
      expect(@nightclub.recently_updated?).to eq false
    end
  end

  describe '#present_address' do
    it 'should concatenate address' do
      expect(subject.present_address).to eq "Am Wauss, OX22"
    end
  end

  describe '#name_as_html_id' do
    it 'should substitute spaces for hypens' do
      expect(subject.name_as_html_id).to match "The-Berghain"
    end
  end

  describe '#open_on_this_day?' do
    it '' do

    end
  end

end
