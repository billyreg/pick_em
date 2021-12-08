json.extract! membership, :id, :user_id, :pool_id, :member_type, :created_at,
              :updated_at
json.url membership_url(membership, format: :json)
