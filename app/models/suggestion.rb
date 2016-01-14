class Suggestion < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :moods
  has_many :appointments
end
