class Suggesting < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :invitation
end
