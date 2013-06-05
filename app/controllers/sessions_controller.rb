class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "/#{user.slug}", notice: "Signed in!"
    #dropbox_user = Dropbox::Verification.new(session[:token], session[:token_secret])
    #user = UserCreator.from_service(dropbox_user)
    #if user.persisted?
    #  session[:user_id] = user.id
    #  Dropbox::Service.create_file_for_user(user.token, user.secret, "sparkfile.txt")
    #  redirect_to "/#{user.slug}", notice: "Your account has been created. You can begin editing your Sparkfile the Apps/sparklr folder of your Dropbox account."
    #else
    #  redirect_to root_path
    #end
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

