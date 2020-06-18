# require 'rails_helper'

RSpec.describe "Promotions", type: :request do

  subject do

  end

  xdescribe "GET /index" do
      let(:nightclub) { Nightclub.create(name: 'test')}
      let(:promotion) { Promotion.create(nightclub: nightclub) }
    # before do
    # end

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
