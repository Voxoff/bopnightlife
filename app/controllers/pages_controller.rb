class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def subscribe
    unless email =~ Devise.email_regexp
      return flash[:notice] = "The email seems to be invalid"
    end

    mailchimp = Gibbon::Request.new
    list_id = ENV['MAILCHIMP_LIST_ID']
    begin
      result = mailchimp.lists(list_id).members.create(
        body: {
          email_address: email,
          status: 'subscribed'
        }
      )
      flash[:notice] = "Thank you for subscribing"
    rescue Gibbon::MailChimpError => error
      if error.title == "Member Exists"
        flash[:error] = "You are already subscribed to the mailing list"
      elsif error.title == "Invalid Resource"
        flash[:error] = "Please enter a valid email address"
      else
        flash[:error] = "#{error.title}"
      end
    end
    # This renders subscribe.js.erb which calls _flash.html.erb.
    # This is temporarily necessary while Rails get their act together re turbolinks
    # Note an empty flash div in _flashes.html.erb to accomodate
  end

  private

  def email
    params.require(:user).permit(:email)[:email]
  end
end
