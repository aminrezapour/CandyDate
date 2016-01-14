class Appointment < ActiveRecord::Base
  belongs_to :available
  belongs_to :suggestion
  has_many :datings
  has_many :users, through: :datings
end
