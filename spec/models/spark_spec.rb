require 'spec_helper'

describe "Spark" do

  before(:all) do
    @sparks = ["this is a #test", "this is a #test2"]
  end

  it "saves new sparks" do
    original_count = Spark.count
    Spark.save_from_text(@sparks, 1)
    expect(Spark.count).to eq(original_count + 2)
  end
end
