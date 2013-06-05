OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox, ENV['DROPBOX_TOKEN'], ENV['DROPBOX_SECRET']
end
