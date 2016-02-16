class Player < ActiveRecord::Base
  has_many :presences, dependent: :nullify
  has_many :matches, through: :presences
  def results
    won = 0
    lost = 0
    tie = 0
    presences.joins(:match).where("matches.played = 't'").each do |presence|
      if (presence.team == 'black' && presence.match.black_goals > presence.match.white_goals) ||
         (presence.team == 'white' && presence.match.black_goals < presence.match.white_goals)
        won+ = 1
      elsif (presence.team == 'black' && presence.match.black_goals < presence.match.white_goals) ||
            (presence.team == 'white' && presence.match.black_goals > presence.match.white_goals)
        lost+ = 1
      elsif presence.match.white_goals == presence.match.black_goals
        tie+ = 1
      end
    end
    [presences.joins(:match).where("matches.played = 't'").count, won, lost, tie]
  end
end
