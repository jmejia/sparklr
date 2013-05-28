require 'spec_helper'

describe DropboxController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'authorize'" do
    it "returns http success" do
      get 'authorize'
      response.should be_success
    end
  end

end
