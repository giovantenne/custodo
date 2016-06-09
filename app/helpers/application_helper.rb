module ApplicationHelper
  def authorized?
    request.authorization.present? && (request.authorization.split(' ', 2).first == 'Basic')
  end

  def cache_key_for_results(fragment)
    max_player = Player.maximum(:updated_at).try(:utc).try(:to_s, :number)
    max_match = Match.maximum(:updated_at).try(:utc).try(:to_s, :number)
    max_presence = Presence.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{fragment}-#{max_player}-#{max_match}-#{max_presence}-#{params}"
  end

  def calculate_pairs
    good_pairs = []
    good_score = 0
    Player.order(:name).each do |p1|
      Player.order(:name).each do |p2|
        v = Presence.joins(:match).where("(player_id = ? or player_id = ?) and ((team = 'white' AND matches.white_goals > matches.black_goals  ) OR (team = 'black' AND matches.black_goals > matches.white_goals))", p1, p2).having("COUNT(\"presences\".\"id\") = 2").group(:match_id,:team).count(:id).count
        if v > good_score 
          good_score = v
          good_pairs = [[p1,p2]]
        elsif v == good_score and !good_pairs.include?([p2,p1])
          good_pairs << [p1,p2]
        end
      end
    end
    bad_pairs = []
    bad_score = 0
    Player.order(:name).each do |p1|
      Player.order(:name).each do |p2|
        v = Presence.joins(:match).where("(player_id = ? or player_id = ?) and ((team = 'white' AND matches.white_goals < matches.black_goals  ) OR (team = 'black' AND matches.black_goals < matches.white_goals))", p1, p2).having("COUNT(\"presences\".\"id\") = 2").group(:match_id,:team).count(:id).count
        if v > bad_score 
          bad_score = v
          bad_pairs = [[p1,p2]]
        elsif v == bad_score and !bad_pairs.include?([p2,p1])
          bad_pairs << [p1,p2]
        end
      end
    end
    [good_pairs, good_score, bad_pairs, bad_score]
  end
end
