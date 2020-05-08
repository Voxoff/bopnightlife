class NightclubsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @nightclubs = Nightclub.all
  end
end
