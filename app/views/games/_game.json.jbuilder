json.extract! game, :id, :favorite_id, :underdog_id, :description, :week_id,
              :created_at, :updated_at
json.url game_url(game, format: :json)
