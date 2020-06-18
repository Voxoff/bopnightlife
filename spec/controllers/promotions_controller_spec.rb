require 'rails_helper'

RSpec.describe PromotionsController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET #show' do
    let(:promotion) { create(:promotion) }
    it 'should success and render to index page' do
      get :show, params: { id: promotion.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'returns @promotion' do
      get :show, params: { id: promotion.id }
      expect(assigns(:promotion)).to eq promotion
    end

    it 'returns @code' do
      get :show, params: { id: promotion.id }

      # TODO: NOT .last
      expect(assigns(:code)).to eq Code.last
    end

    it 'returns @svg' do
      get :show, params: { id: promotion.id }

      # TODO: NOT .match
      expect(assigns(:svg)).to match /svg/
    end
  end
end
