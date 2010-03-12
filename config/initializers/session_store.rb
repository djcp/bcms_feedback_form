# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcms_feedback_form_session',
  :secret      => '2c0fbfffdcacff9d54d3feef0f22c657de56d987342e095d750917285700893f627f70863e9a55bc369667e87f11d7c8757506cb68f0e7465c515923dbd36a8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
