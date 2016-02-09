class Match < ActiveRecord::Base
  def name
    played_on
  end
end
