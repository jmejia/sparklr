require 'spec_helper'

describe "user visits profile" do
  it "visits the home page" do
    visit 'http://lvh.me:1234/'
    @token = ENV["USER_TOKEN"]
    @secret = ENV["USER_SECRET"]
    Dropbox::Service.connect
    user = Dropbox::Verification.new(@token, @secret)
    Dropbox::Verification.stub!( :new ).with(@token, @secret).and_return( user )
    get dropbox_create_path
    expect(page).to have_content "sparklr"
  end

end
