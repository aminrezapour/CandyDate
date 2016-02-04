class Invitation < ActiveRecord::Base
  has_many :invitings
  has_many :users, through: :invitings
  has_many :suggestings
  has_many :suggestions, through: :suggestings
  serialize :days_inviter, Array
end
