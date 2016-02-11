class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :suggestions
  has_many :invitations_sent, class_name: "Invitation", foreign_key: 'inviter_id'
  has_many :invitations_received, class_name: "Invitation", foreign_key: 'invitee_id'
  has_many :datings
  has_many :appointments, through: :datings

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name.split.first
        user.image = auth.info.image
      end
  end

end
