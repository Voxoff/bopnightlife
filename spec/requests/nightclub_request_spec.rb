require 'rails_helper'

RSpec.describe "Nightclubs", type: :request do

  xdescribe "GET /index" do
    it "returns http success" do
      get "/nightclub/index"
      expect(response).to have_http_status(:success)
    end
  end

end
