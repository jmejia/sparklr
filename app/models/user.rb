class User < ActiveRecord::Base
  attr_accessible :email, :display_name, :secret, :token, :dropbox_id

  has_many :sparks, :dependent => :destroy

  def self.from_omniauth(auth)
    where(dropbox_id: auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = create! do |user|
      user.dropbox_id = auth["uid"]
      user.token = auth["extra"]["access_token"].token
      user.secret = auth["extra"]["access_token"].secret
      user.display_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.slug = auth["info"]["name"].gsub(" ", "-").downcase
    end
    Dropbox::Service.create_file_for_user(user.token, user.secret, "sparkfile.txt")
    user
  end
end
