module ApplicationHelper
  def authorized?
    request.authorization.present? && (request.authorization.split(' ', 2).first == 'Basic')
  end
end
