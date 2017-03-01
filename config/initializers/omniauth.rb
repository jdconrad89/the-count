Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['client_id'], ENV['client_secret']
end
