require 'rails_helper'

RSpec.describe Nightclub, type: :model do
  describe do

  end

  subject { build(:nightclub, params) }
  let(:params) { { } }

  describe '#gender_mix_string' do
    it '' do

    end
  end

  describe '#current_capacity_string' do
    it 'should return field with %' do
      expect(subject.current_capacity_string).to eq
    end
  end

  describe '#capacity_percentage_string' do
    it 'should return field with %' do
      expect(subject.capacity_percentage_string).to eq
    end
  end

  fdescribe '#queue_time_string' do
    let(:params) { {  queue_time: 20 } }
    it 'should return field with %' do
      require 'pry'; binding.pry
      expect(subject.queue_time_string).to eq "20%"
    end
  end

  describe '#live_data?' do
    context 'no live data provided' do
      it 'should return false' do
        expect(subject.live_data?).to eq false
      end
    end
  end

  describe '#recently_updated?' do
    it '' do

    end
  end

  describe '#present_address' do
    it 'should concatenate address' do
      expect(subject.present_address).to eq "Am Wauss, OX22"
    end
  end

  describe '#name_as_html_id' do
    it 'should substitute spaces for hypens' do
      expect(subject.name_as_html_id).to eq "The-Berghain"
    end
  end

  describe '#open_on_this_day?' do
    it '' do

    end
  end

end
