require 'rails_helper'

RSpec.describe PromotionsController, type: :controller do
  subject do
    # post :create, params: params, format: :json
    get :show
    JSON.parse(response.body)
  end

  xit 'works' do
    subject
    expect(response).to be true
  end
end
