require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET #subscribe' do
    context 'invalid email' do
      let(:email) { 'not_an_email' }
      let(:params) { { user: { email: email } } }

      it 'returns a flash' do
        post :subscribe, params: params, xhr: true
        expect(flash[:notice]).to be_present
      end

      context 'test email' do
        let(:email) { 'test@test.com' }
        it 'returns a flash' do
          post :subscribe, params: params, xhr: true
          expect(flash[:notice]).not_to be_present
        end
      end
    end
  end
end
