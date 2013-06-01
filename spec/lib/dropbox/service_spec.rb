require "spec_helper"

describe "Dropbox::Service" do

  before(:all) do
    @dropbox = Dropbox::Service.connect
    @token ||= "oq7q18wd0qw548z"
    @secret ||= "njwgxqtjo65g70m"
    @user = Dropbox::Service.new(@token, @secret)
  end

  it "connects to the dropbox api" do
    expect(@dropbox).to eq("sandbox")
  end

  it "retrieves a user's account" do
    expect(@user.account.display_name).to eq("josh mejia")
  end

  context "finding a file" do
    before(:all) do
      @file = @user.download("sparkfile_test.txt")
    end

    it "reads the content of a text file" do
      expect(@file).to eq("test1\ntest2")
    end
  end

end
