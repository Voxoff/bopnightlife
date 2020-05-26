class Email < ApplicationRecord
  # after_create :add_to_mailchimp

  # def add_to_mailchimp
  #   mailchimp = Gibbon::Request.new(api_key: ENV['MAILCHIMP_KEY'])
  #   list_id = ENV['MAILCHIMP_LIST_ID']
  #   begin
  #     result = mailchimp.lists(list_id).members.create(
  #       body: {
  #         email_address: email,
  #         status: 'subscribed'
  #       }
  #     )
  #   flash[:notice] = "Thank you for subscribing"
  #   rescue Gibbon::MailChimpError => error
  #     if error.title == "Member Exists"
  #       flash[:error] = "You are already subscribed to the mailing list"
  #     elsif error.title == "Invalid Resource"
  #       flash[:error] = "Please enter a valid email address"
  #     else
  #       flash[:error] = "#{error.title}"
  #     end
  #   ensure
  #     redirect_back(fallback_location: root_path)
  #   end
  # end
end
