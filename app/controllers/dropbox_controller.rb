class DropboxController < ApplicationController
  def create
    dropbox_user = DropboxVerification.new(session[:token], session[:token_secret]).attributes
    user = UserCreator.create_with_service(dropbox_user)
    redirect_to user_path(user)
  end

  def authorize
    request_token = DropboxVerification.request_token
    session[:token] = request_token.token
    session[:token_secret] = request_token.secret
    redirect_to request_token.authorize_url(:oauth_callback => 'http://lvh.me:3000/dropbox/create')
  end

end
