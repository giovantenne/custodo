json.array!(@matches) do |match|
  json.extract! match, :id, :played_on, :white_goals, :black_goals
  json.url match_url(match, format: :json)
end
