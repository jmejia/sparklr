class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    Dropbox::Service.create_file_for_user(user.token, user.secret, "sparkfile.txt")
    redirect_to "/#{user.slug}", notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out."
  end

  def authorize
    request_token = Dropbox::Verification.request_token
    session[:token] = request_token.token
    session[:token_secret] = request_token.secret
    redirect_to request_token.authorize_url(:oauth_callback => ENV["DROPBOX_CALLBACK"])
  end

end

