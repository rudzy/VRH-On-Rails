json.array!(@games) do |game|
  json.extract! game, :id, :match_day, :overtime
  json.url game_url(game, format: :json)
end
