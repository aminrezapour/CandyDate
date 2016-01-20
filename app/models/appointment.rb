class Appointment < ActiveRecord::Base
  belongs_to :available
  belongs_to :suggestion
  has_many :datings
  has_many :users, through: :datings

  def send_text_message
    users = self.users;

    user1 = users.first
    user2 = users.last

    number1_to_send_to = user1.telephone
    number2_to_send_to = user2.telephone

    twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = "3235215929"

    loc = self.suggestion.name
    on_this_date = self.available.slot.inspect

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => [number1_to_send_to, number2_to_send_to],
      :body => "#{user1.name} and #{user2.name} are having a date on #{on_this_date} at #{loc}."
    )
  end

end
