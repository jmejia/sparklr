class DropboxController < ApplicationController
  def create
    dropbox_user = Dropbox::Verification.new(session[:token], session[:token_secret])
    user = UserCreator.create_with_service(dropbox_user)
    if user.persisted?
      Dropbox::Service.create_file_for_user(user.token, user.secret, "sparkfile.txt")
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def authorize
    request_token = Dropbox::Verification.request_token
    session[:token] = request_token.token
    session[:token_secret] = request_token.secret
    redirect_to request_token.authorize_url(:oauth_callback => ENV["DROPBOX_CALLBACK"])
  end

end
