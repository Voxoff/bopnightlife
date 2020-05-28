class PromotionsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @promotion = Promotion.find(params[:id])
    @code = Code.create(promotion: @promotion)
  end
end
