require 'rails_helper'

RSpec.describe NightclubsController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'returns @nightclubs' do
      Nightclub.destroy_all
      @nightclub =  create(:nightclub)
      get :index
      expect(assigns(:nightclubs)).to match_array [@nightclub]
    end
  end
end
