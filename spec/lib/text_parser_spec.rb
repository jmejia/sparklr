describe "TextParser" do

  context "creating a new file" do
    before(:all) do
      @file ||= TextParser.new("test1\ntest2")
    end

    it "creates a new instance" do
      expect(@file.content).to eq("test1\ntest2")
    end

    it "splits the text file at new lines" do
      expect(@file.split).to eq(["test1", "test2"])
    end

    it "returns the split array sorted in reverse order" do
      expect(@file.split_and_reverse).to eq(["test2", "test1"])
    end
  end

end
