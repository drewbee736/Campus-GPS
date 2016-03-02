json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :email_confirmed, :confirm_token
  json.url user_url(user, format: :json)
end
