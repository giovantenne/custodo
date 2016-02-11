module ApplicationHelper
  def authorized?
    request.authorization.present? && (request.authorization.split(' ', 2).first == 'Basic')
  end
  def cache_key_for_results(fragment)
    max_player= Player.maximum(:updated_at).try(:utc).try(:to_s, :number)
    max_match = Match.maximum(:updated_at).try(:utc).try(:to_s, :number)
    max_presence = Presence.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{fragment}-#{max_player}-#{max_match}-#{max_presence}"
  end
end
