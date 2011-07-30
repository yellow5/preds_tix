require 'spec_helper'

describe "Seasons" do
  describe "GET /seasons" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get seasons_path
      response.status.should be(200)
    end
  end
end
