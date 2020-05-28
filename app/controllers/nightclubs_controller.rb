class NightclubsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @nightclubs = Nightclub.includes(:address, photo_attachment: :blob)
  end
end
