require 'rails_helper'

RSpec.describe Code, type: :model do
  describe '#generate_code' do
    subject { create(:code) }
    it 'should add a code after a record is created' do
      expect(subject.code).not_to be_empty
    end

    it 'updates model with id+3 letter random string' do
      id = subject.id
      expected_length = id.to_s.size + 3
      expect(subject.code).to match(/#{id}/)
      expect(subject.code.size).to be expected_length
    end
  end

  describe '#activate' do
    it 'should ensure activate is true' do
      expect(subject.activated).to be false
      subject.activate
      expect(subject.activated).to be true
    end
  end

  describe '#stale' do
    before do
      create(:code)
      create(:code, activated: true)
      Timecop.freeze 2.weeks.ago do
        create(:code)
      end
    end

    it 'should retrieve disactivated codes updated over a week ago' do
      expect(Code.stale.size).to eq 0
      code = nil
      Timecop.freeze 2.weeks.ago do
        code = create(:code, activated: false)
      end
      expect(Code.stale).to match_array [code]
    end
  end
end
