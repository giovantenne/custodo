class Player < ActiveRecord::Base
  has_many :presences
  has_many :matches, through: :presences
end
