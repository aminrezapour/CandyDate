class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :moods, dependent: :destroy

  after_create :make_moods

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
      end
  end



  private

  def make_moods
    self.moods.create(name: "Favorites")
    self.moods.create(name: "Bars")
    self.moods.create(name: "Restaurants")
    self.moods.create(name: "Music")
    self.moods.create(name: "Movies")
    self.moods.create(name: "Outdoor")
    self.moods.create(name: "Your Call")
  end

end
