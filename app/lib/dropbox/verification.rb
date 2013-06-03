module Dropbox
  class Verification

    attr_reader :oauth_token, :oauth_secret, :request_token, :consumer,
                :access_token, :dropbox_user, :uid

    def self.request_token
      Dropbox::Service.connect
      consumer.get_request_token
    end

    def self.consumer
      Dropbox::API::OAuth.consumer(:authorize)
    end

    def initialize(oauth_token, oauth_secret)
      @oauth_token = oauth_token
      @oauth_secret = oauth_secret
      @consumer = Dropbox::Verification.consumer
    end

    def attributes
      @attributes ||= get_user_attributes
    end

    def uid
      attributes[:uid]
    end

    def email
      attributes[:email]
    end

    def display_name
      attributes[:display_name]
    end

    def token
      attributes[:token]
    end

    def secret
      attributes[:secret]
    end

    def get_user_attributes
      {
        uid: dropbox_user.account.uid,
        token: access_token.token,
        secret: access_token.secret,
        email: dropbox_user.account.email,
        display_name: dropbox_user.account.display_name
      }
    end

    def dropbox_user
      @dropbox_user ||= Dropbox::API::Client.new(token: access_token.token, secret: access_token.secret)
    end

    def access_token
      @access_token ||= request_access_token
    end

    def request_access_token
      request_token.get_access_token(:oauth_verifier => oauth_token)
    end

    def request_token
      @request_token ||= request_token_from_hash
    end

    def request_token_from_hash
      hash = { oauth_token: oauth_token, oauth_token_secret: oauth_secret }
      OAuth::RequestToken.from_hash(consumer, hash)
    end

  end
end
