class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def subscribe
    if email =~ Devise.email_regexp
      flash[:notice] = "Thank you for subscribing"
      Email.create!(email: email, opt_out: false)
    else
      flash[:notice] = "The email seems to be invalid"
    end
  end

  private

  def email
    params.require(:user).permit(:email)[:email]
  end
end
