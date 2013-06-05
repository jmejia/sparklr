describe "TextParser" do

  context "creating a new file" do
    before(:all) do
      @file ||= "test1\ntest2"
    end

    it "creates a new instance of a text file" do
      expect(@file).to eq("test1\ntest2")
    end

  end
end
