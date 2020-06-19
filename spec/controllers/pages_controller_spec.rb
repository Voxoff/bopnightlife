require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    sign_in user
    # just for safety
    require 'webmock/rspec'
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  describe 'GET #subscribe' do
      let(:params) { { user: { email: email } } }
    context 'invalid email' do
      let(:email) { 'not_an_email' }

      it 'returns a flash' do
        post :subscribe, params: params, xhr: true
        expect(flash[:notice]).to be_present
      end

      context 'test email' do
        let(:email) { 'test@test.com' }
        it 'returns a flash' do
          allow_any_instance_of(Gibbon::Request).to receive(:create).and_raise Gibbon::MailChimpError.new("Test_error", title: "Invalid Resource")
          post :subscribe, params: params, xhr: true

          expect(flash[:notice]).not_to be_present
          expect(flash[:error]).to eq "Please enter a valid email address"
        end
      end

      context 'duplicate email' do
        let(:email) { 'test@test.com' }
        it 'returns a flash' do
          allow_any_instance_of(Gibbon::Request).to receive(:create).and_raise Gibbon::MailChimpError.new("Test_error", title: "Member Exists")

          post :subscribe, params: params, xhr: true

          expect(flash[:notice]).not_to be_present
          expect(flash[:error]).to eq "You are already subscribed to the mailing list"
        end
      end


      context 'something unexpected' do
        let(:email) { 'test@test.com' }
        it 'returns a flash with the unknown message propagated' do
          allow_any_instance_of(Gibbon::Request).to receive(:create).and_raise Gibbon::MailChimpError.new("Test_error", title: "ERRORRR")

          post :subscribe, params: params, xhr: true

          expect(flash[:notice]).not_to be_present
          expect(flash[:error]).to eq "ERRORRR"
        end
      end
    end

    context 'valid email' do
      let(:email) { "guybennett@hotmail.com" }
      it 'returns 200' do
        without_partial_double_verification do
          request = double(:request)
          member_request = double(:member_request)
          expect_any_instance_of(Gibbon::Request).to receive(:lists).and_return(request)
          expect(request).to receive(:members).and_return(member_request)
          expect(member_request).to receive(:create).and_return(200)

          post :subscribe, params: params, xhr: true

          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
