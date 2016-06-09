class StaticController < ApplicationController
  def dashboard
  end

  def logout
    session['logged'] = ''
    redirect_to root_path
  end

  def login
  end

  def check_login
    if params['username'] == ENV['username'] &&
       params['password'] == ENV['password']
      session['logged'] = 'true'
      redirect_to matches_path(admin: true)
    else
      redirect_to '/login'
    end
  end

  def stats
    @good_pairs = []
    @good_score = 0
    Player.order(:name).each do |p1|
      Player.order(:name).each do |p2|
        v = Presence.joins(:match).where("(player_id = ? or player_id = ?) and ((team = 'white' AND matches.white_goals > matches.black_goals  ) OR (team = 'black' AND matches.black_goals > matches.white_goals))", p1, p2).having("COUNT(\"presences\".\"id\") = 2").group(:match_id,:team).count(:id).count
        if v > @good_score 
          @good_score = v
          @good_pairs = [[p1,p2]]
        elsif v == @good_score and !@good_pairs.include?([p2,p1])
          @good_pairs << [p1,p2]
        end
      end
    end
    @bad_pairs = []
    @bad_score = 0
    Player.order(:name).each do |p1|
      Player.order(:name).each do |p2|
        v = Presence.joins(:match).where("(player_id = ? or player_id = ?) and ((team = 'white' AND matches.white_goals < matches.black_goals  ) OR (team = 'black' AND matches.black_goals < matches.white_goals))", p1, p2).having("COUNT(\"presences\".\"id\") = 2").group(:match_id,:team).count(:id).count
        if v > @bad_score 
          @bad_score = v
          @bad_pairs = [[p1,p2]]
        elsif v == @bad_score and !@bad_pairs.include?([p2,p1])
          @bad_pairs << [p1,p2]
        end
      end
    end
  end
end
