describe "Dropbox::File" do

  before(:all) do
    @dropbox ||= Dropbox::Service.connect
    @token   ||= "oq7q18wd0qw548z"
    @secret  ||= "njwgxqtjo65g70m"
    @user    ||= Dropbox::Service.new(@token, @secret)
  end

  context "finding a file" do
    before(:all) do
      #@file = Dropbox::File.find_from_dropbox(@user, "sparkfile_test.txt")
      #@file = @user.find("sparkfile_test.txt")
    end

    it "finds a specified text file" do
      expect(@user.account.display_name).to eq("josh mejia")
      puts @user.methods.sort
      #expect(@file.class).to eq(Dropbox::API::File)
    end

    #it "reads the content of a text file"
  end

  #it "splits the text file at new lines"
  #it "reverses the array of lines"
end
