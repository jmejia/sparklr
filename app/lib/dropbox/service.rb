module Dropbox
  class Service

    attr_reader :token, :secret

    def initialize(token, secret)
      @token = token
      @secret = secret
    end

    def account
      @account ||= client.account
    end

    def client
      @client ||= Dropbox::API::Client.new(token: token, secret: secret)
    end

    def download(filename)
      @download = client.download filename
    end

    def create_file(filename)
      client.upload 'sparkfile.txt', ''
    end

    def self.connect
      Dropbox::API::Config.app_key = ENV["DROPBOX_TOKEN"]
      Dropbox::API::Config.app_secret = ENV["DROPBOX_SECRET"]
      Dropbox::API::Config.mode = "sandbox"
    end

    def self.lines_from_file(token, secret, filename)
      connect
      user = Dropbox::Service.new(token, secret)
      user.download(filename)
    end

    def self.create_file_for_user(token, secret, filename)
      connect
      user = Dropbox::Service.new(token, secret)
      user.create_file(filename)
    end

  end
end
