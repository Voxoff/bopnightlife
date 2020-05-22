class PromotionsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @promotion = Promotion.find(params[:id])
    binding.pry
    remote_ip = request.remote_ip
    @code = Code.find_by(ip_address: ip_address, promotion: @promotion)
    @code = Code.create(ip_address: ip_address, promotion: @promotion) if @code.nil?
  end

  def ip_address
    # remote_ip = request.remote_ip
    # IPAddr.new(remote_ip) if remote_ip
  end
end
