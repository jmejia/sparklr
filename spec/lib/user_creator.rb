require 'spec_helper'

class TestService

  attr_reader :uid, :token, :secret, :email, :display_name

  def uid
    123
  end

  def token
    "token"
  end

  def secret
    "secret"
  end

  def email
    "email"
  end

  def display_name
    "name"
  end
end

describe UserCreator do

  before(:all) do
    @service = TestService.new
  end

  it "creates a new service with service data" do
    user = UserCreator.create_with_service(@service)
    expect(user.dropbox_id).to eq(123)
  end

end
