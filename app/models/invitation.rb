class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"
  has_many :suggestings, dependent: :nullify
  has_many :suggestions, through: :suggestings
  serialize :days_inviter, Array
  has_one :raincheck

  def send_text_message
    inviter = self.inviter
    number1_to_send_to = self.invitee_tel

    twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = "3235215929"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => [number1_to_send_to],
      :body => "#{inviter.name} has initiated a CandyDate invitation with you. Go to www.candydate.me and confirm your date."
    )
  end

end
