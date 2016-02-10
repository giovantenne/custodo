json.array!(@matches) do |match|
  json.extract! match, :id, :played_on, :white_goal, :black_goal
  json.url match_url(match, format: :json)
end
