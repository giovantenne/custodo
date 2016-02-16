module PlayersHelper
  def presence_color(p)
    if (p.team == "white" and p.match.white_goals > p.match.black_goals) or
     (p.team == "black" and p.match.white_goals < p.match.black_goals) 
      return "success"
    elsif (p.team == "white" and p.match.white_goals < p.match.black_goals) or
     (p.team == "black" and p.match.white_goals > p.match.black_goals )
      return "danger"
    else
      return "default"
    end
  end
  def score(results)
    if results[0]>0
      return (results[1]*3)+(results[3]*2+results[2])
    else
      return 0
    end
  end
end
