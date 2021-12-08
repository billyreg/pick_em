json.extract! pick, :id, :user_id, :game_id, :team_id, :weight, :created_at,
              :updated_at
json.url pick_url(pick, format: :json)
