Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
  "282060097830-c8etbqo2hre50jql3rri9b2jtcert53d.apps.googleusercontent.com", # GOOGLE_CLIENT_ID
  "3QtLqFc3Enlpd-ZQVypMny3P" # GOOGLE_CLIENT_SECRET
end