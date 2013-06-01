require "spec_helper"
describe "DropboxVerification" do

  it "connects to the dropbox api" do
    dropbox = DropboxService.connect
    expect(dropbox).to eq("sandbox")
  end

  context "authorizing a dropbox account" do
    before(:all) do
      @request_token ||= DropboxVerification.request_token
      @token ||= @request_token.token
      @secret ||= @request_token.secret
      @dropbox ||= DropboxVerification.new(@token, @secret)
      @fake_attributes ||= {
          uid: 4289865,
          token: "y5nzsymtlxnl6ng",
          secret: "dlo58mrigdpjkp3",
          email: "joshua.mejia@gmail.com",
          display_name: "josh mejia"
        }
      @dropbox.stub(:get_user_attributes).and_return(@fake_attributes)
    end

    it "receives a request token" do
      expect(@token.size).to be(16)
    end

    it "returns uid" do
      expect(@dropbox.uid).to eq(4289865)
    end

    it "returns token" do
      expect(@dropbox.token).to eq("y5nzsymtlxnl6ng")
    end

    it "returns secret" do
      expect(@dropbox.secret).to eq("dlo58mrigdpjkp3")
    end

    it "returns email" do
      expect(@dropbox.email).to eq("joshua.mejia@gmail.com")
    end

    it "returns display_name" do
      expect(@dropbox.display_name).to eq("josh mejia")
    end
  end

end

