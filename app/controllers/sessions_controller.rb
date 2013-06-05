class SessionsController < ApplicationController

  def create
    dropbox_user = Dropbox::Verification.new(session[:token], session[:token_secret])
    user = UserCreator.from_service(dropbox_user)
    if user.persisted?
      Dropbox::Service.create_file_for_user(user.token, user.secret, "sparkfile.txt")
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
    #user = User.from_omniauth(env["omniauth.auth"])
    #session[:user_id] = user.id
    #redirect_to myaccount_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url(subdomain: "www")
  end
end
