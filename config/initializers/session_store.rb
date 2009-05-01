# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OligoOrganizer_session',
  :secret      => '4040985f5d8fc724bda71f55ae4db2f00ad4dcd81d427db1d42054c52f9f99651e606f42dc86c60ef4af154cc26d52c2db4620b738d8cecc5e6bf9544185179d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
