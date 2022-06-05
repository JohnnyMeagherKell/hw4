secret = "puppies"
puts secret
encrypted_secret = BCrypt::Password.create(secret)
puts encrypted_secret