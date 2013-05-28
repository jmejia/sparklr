class User < ActiveRecord::Base
  attr_accessible :email, :display_name, :secret, :token, :dropbox_id
end
