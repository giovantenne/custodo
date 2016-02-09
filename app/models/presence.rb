class Presence < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  def team_enum
    [["black"],["white"]]
  end
  def name
    "#{player.name} - #{match.played_on}"
  end

  after_initialize do
    if new_record?
      self.match ||= Match.order("played_on DESC").first
    end
  end
  rails_admin do
    edit do
      fields :match, :player, :team
    end
  end
end
