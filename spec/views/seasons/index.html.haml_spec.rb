require 'spec_helper'

describe "seasons/index.html.erb" do
  before(:each) do
    assign(:seasons, [
      stub_model(Season,
        :years => "Years"
      ),
      stub_model(Season,
        :years => "Years"
      )
    ])
  end

  it "renders a list of seasons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Years".to_s, :count => 2
  end
end
