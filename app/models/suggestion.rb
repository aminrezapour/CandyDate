class Suggestion < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  has_many :suggestings
  has_many :invitations, through: :suggestings

  validates :name, length: { minimum: 5 }, presence: true
end
