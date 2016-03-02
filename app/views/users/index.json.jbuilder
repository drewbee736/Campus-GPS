json.array!(@users) do |user|
<<<<<<< HEAD
  json.extract! user, :id, :name
=======
  json.extract! user, :id, :email, :password_digest, :email_confirmed, :confirm_token
>>>>>>> origin/master
  json.url user_url(user, format: :json)
end
