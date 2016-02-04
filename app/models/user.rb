class User < ActiveRecord::Base

  after_create :first_invitation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :suggestions
  has_many :invitings
  has_many :invitations, through: :invitings
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


  private

  def first_invitation
    self.invitations << Invitation.where(invitee_tel: @user.telephone)
  end

end
