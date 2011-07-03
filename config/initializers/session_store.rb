# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Xintan_session',
  :secret      => '937c9fd7e8d4263c612de8ebe5c5cc1c21e28bcd8c387bc403906dc3ca03805b4b589d0661c386b3e5f1722ca6d5d1bb27d3ce33e651feb01971f15c18161fd8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
