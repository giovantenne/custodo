class Match < ActiveRecord::Base
  has_many :presences
  has_many :players, through: :presences
end
