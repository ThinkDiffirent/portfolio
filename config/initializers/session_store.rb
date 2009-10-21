# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_portefolio_session',
  :secret      => 'cdfb69771ba4999575e0f9746cae4c4472b10db24b56cba28a21932f73d3a2d3bfaa18ea1c137a487e8ea609e350365a540f4a9fa8734a1688964c1d3fecacc0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
