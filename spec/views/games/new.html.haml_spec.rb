require 'spec_helper'

describe "games/new.html.haml" do
  let!(:season) { Season.create! }

  before(:each) do
    assign(:game, stub_model(Game,
      :season_id => 1,
      :opponent => "MyString",
      :preseason => false
    ).as_new_record)
    assign(:seasons, Season.all)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path, :method => "post" do
      assert_select "select#game_season_id", :name => "game[season_id]"
      assert_select "option[value=#{season.id}]"
      assert_select "input#game_opponent", :name => "game[opponent]"
      assert_select "input#game_preseason", :name => "game[preseason]"
    end
  end
end
