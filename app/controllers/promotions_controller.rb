class PromotionsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @promotion = Promotion.find(params[:id])
    @code = Code.create(promotion: @promotion)

    require 'rqrcode'
    qrcode = RQRCode::QRCode.new(@code.code)
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      )
  end
end
