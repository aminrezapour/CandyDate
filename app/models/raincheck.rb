class Raincheck < ActiveRecord::Base
  belongs_to :invitation
  serialize :days_rainchecker, Array
end
