class DropboxService

  attr_reader :token, :token_secret, :user, :consumer,
              :request_token, :access_token, :dropbox_user

  def initialize(token, token_secret, user = User)
    @token = token
    @user = user
    @token_secret = token_secret
    @consumer = DropboxService.consumer
  end

  def request_token_from_hash
    hash = { oauth_token: token, oauth_token_secret: token_secret }
    OAuth::RequestToken.from_hash(consumer, hash)
  end

  def request_token
    @request_token ||= request_token_from_hash
  end

  def access_token
    @access_token ||= request_access_token
  end

  def dropbox_user
    @dropbox_user ||= Dropbox::API::Client.new(token: access_token.token, secret: access_token.secret)
  end

  def create_user
    user.create do |user|
      user.dropbox_id = dropbox_user.account.uid
      user.token = access_token.token
      user.secret = access_token.secret
      user.email = dropbox_user.account.email
      user.display_name = dropbox_user.account.display_name
    end
  end

  def request_access_token
    request_token.get_access_token(:oauth_verifier => token)
  end

  def self.connect
    Dropbox::API::Config.app_key = ENV["DROPBOX_TOKEN"]
    Dropbox::API::Config.app_secret = ENV["DROPBOX_SECRET"]
    Dropbox::API::Config.mode = "sandbox"
  end

  def self.consumer
    Dropbox::API::OAuth.consumer(:authorize)
  end

  def self.fetch_request_token(consumer)
    consumer.get_request_token
  end

  def self.request_token
    connect
    fetch_request_token(consumer)
  end

end
