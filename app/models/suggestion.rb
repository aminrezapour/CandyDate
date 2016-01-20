class Suggestion < ActiveRecord::Base
  has_many :suggestings
  has_many :users, through: :suggestings
  has_and_belongs_to_many :moods
  has_many :appointments
end
