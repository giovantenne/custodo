class Match < ActiveRecord::Base
  has_many :presences
  has_many :players, through: :presences
  accepts_nested_attributes_for :players, :allow_destroy => true
  def name
    played_on
  end

end
