class Player < ActiveRecord::Base
  has_many :presences
  has_many :matches, through: :presences
  def results
    won = 0
    lost = 0
    tie =0
    presences.each do |presence|
      if (presence.team == "black" and presence.match.black_goals > presence.match.white_goals) or
       (presence.team == "white" and presence.match.black_goals < presence.match.white_goals) 
        won=won+1
      elsif (presence.team == "black" and presence.match.black_goals < presence.match.white_goals) or
      (presence.team == "white" and presence.match.black_goals > presence.match.white_goals) 
        lost=lost+1
      elsif presence.match.white_goals == presence.match.black_goals 
        tie=tie+1
      end
    end
    return [presences.count, won, lost, tie]
  end
end
