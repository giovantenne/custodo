json.array!(@presences) do |presence|
  json.extract! presence, :id, :player_id, :match_id, :team
  json.url presence_url(presence, format: :json)
end
