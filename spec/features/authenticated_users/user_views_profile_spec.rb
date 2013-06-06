require 'spec_helper'

describe "user visits profile" do

  before(:all) do
    @dropbox = Dropbox::Service.connect
    @user = User.create! do |user|
      user.dropbox_id = 1234567
      user.token = ENV["USER_TOKEN"]
      user.secret = ENV["USER_SECRET"]
      user.display_name = "josh mejia"
      user.email = "joshua.mejia@gmail.com"
      user.slug = "josh-mejia"
    end
  end

  it "visits the home page", js: true do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit 'http://lvh.me:1234/josh-mejia'
    #click_link 'Update From Dropbox'
    sleep 5
    expect(page).to have_content "My Account"
  end

end
