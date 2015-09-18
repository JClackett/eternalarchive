json.array!(@contributions) do |contribution|
  json.extract! contribution, :id, :url, :user_id
  json.url contribution_url(contribution, format: :json)
end
