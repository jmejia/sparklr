class UserCreator

  attr_reader :service

  def self.create_with_service(service)
    new(service).create_user
  end

  def initialize(service)
    @service = service
  end

  def create_user
    User.create do |user|
      user.dropbox_id   = service.uid
      user.token        = service.token
      user.secret       = service.secret
      user.email        = service.email
      user.display_name = service.display_name
      user.slug         = service.display_name.gsub(" ", "-").downcase
    end
  end
end
