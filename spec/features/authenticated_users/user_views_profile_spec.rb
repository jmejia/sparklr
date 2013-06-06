require 'spec_helper'

describe "user visits profile" do

  before(:each) do
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

  it "clicks update dropbox link" do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit 'http://lvh.me:1234/josh-mejia'
    click_link 'Update From Dropbox'
    expect(DropboxWorker).to have(1).jobs
  end

  it "edits their own account details" do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit 'http://lvh.me:1234/users'
    click_link 'Edit'
    fill_in('user_display_name', with: 'Joshua')
    click_button "Update User"
    visit 'http://lvh.me:1234/users'
    expect(page).to have_content 'Joshua'
  end

end
