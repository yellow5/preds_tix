# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PredsTix::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || 'f196e7cf47f6570b56c19c02bee1d418c2ba18714c790ed413a3444efd93875452d06fcd78829e1bc9fd1ef3312bdd1461b77540a48ce021ef2f9ce692ae5e79'
