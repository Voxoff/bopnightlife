class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def subscribe
    binding.pry
    if email =~ Devise.email_regexp
      flash[:notice] = "Thank you for subscribing"
      User.create(email: email_params)
    else
      flash[:notice] = "The email is invalid"
    end

  end

  private

  def email_params
    params.permit(:email)
  end
end
