require 'spec_helper'

describe "seasons/edit.html.haml" do
  before(:each) do
    @season = assign(:season, stub_model(Season,
      :years => "MyString"
    ))
  end

  it "renders the edit season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path(@season), :method => "post" do
      assert_select "input#season_years", :name => "season[years]"
    end
  end
end
