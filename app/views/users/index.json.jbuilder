json.array!(@users) do |user|
  json.extract! user, :id, username:, job_title:, biography:, email:
  json.url user_url(user, format: :json)
end
