json.array!(@users) do |user|
  json.extract! user, :email, :name, :username, :password_hash, :password_salt, :admin
  json.url user_url(user, format: :json)
end