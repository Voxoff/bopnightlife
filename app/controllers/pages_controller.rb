class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def subscribe
    if email =~ Devise.email_regexp
      flash[:notice] = "Thank you for subscribing"
      User.create!(email: email)
    else
      flash[:notice] = "The email is invalid"
    end

  end

  private

  def email
    params.require(:user).permit(:email)[:email]
  end
end
