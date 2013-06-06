require 'spec_helper'

describe "user visits their sparks" do

  before(:all) do
    @dropbox = Dropbox::Service.connect
    @new_user = User.create! do |user|
      user.dropbox_id = 1234567
      user.token = ENV["USER_TOKEN"]
      user.secret = ENV["USER_SECRET"]
      user.display_name = "josh mejia"
      user.email = "joshua.mejia@gmail.com"
      user.slug = "test"
    end

    @spark = Spark.create!(text: "This is a test", user_id: @new_user.id)
  end

  let(:user) { @new_user }

  it "clicks update dropbox link" do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit 'http://lvh.me:1234/test'
    click_link 'Edit'
    fill_in('spark_tag_list', with: 'tag1, tag2')
    click_button "Update Spark"
    visit 'http://lvh.me:1234/tags/tag1'
    expect(page).to have_content 'This is a test'
  end

end

