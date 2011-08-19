require 'spec_helper'

describe "seasons/new.html.haml" do
  before(:each) do
    assign(:season, stub_model(Season,
      :years => "MyString"
    ).as_new_record)
  end

  it "renders new season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path, :method => "post" do
      assert_select "input#season_years", :name => "season[years]"
    end
  end
end
