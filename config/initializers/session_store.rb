# Be sure to restart your server when you modify this file.

Number::Application.config.session_store :cookie_store, key: '_number_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Number::Application.config.session_store :active_record_store
