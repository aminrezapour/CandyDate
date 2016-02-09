class Invitation < ActiveRecord::Base
  has_many :invitings
  has_many :users, through: :invitings
  has_many :suggestings
  has_many :suggestions, through: :suggestings
  serialize :days_inviter, Array
  has_one :raincheck

  def send_text_message
    inviter = self.users.first.name
    number1_to_send_to = self.invitee_tel

    twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = "3235215929"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => [number1_to_send_to],
      :body => "#{inviter} has initiated a CandyDate invitation with you. Go to www.candydate.me and choose when you are available."
    )
  end

end
