require 'spec_helper'

describe "seasons/show.html.haml" do
  before(:each) do
    @season = assign(:season, stub_model(Season,
      :years => "Years"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Years/)
  end
end
