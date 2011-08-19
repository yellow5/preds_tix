require 'spec_helper'

describe "games/edit.html.haml" do
  let!(:season) { Season.create! }

  before(:each) do
    @game = assign(:game, stub_model(Game,
      :season_id => 1,
      :opponent => "MyString",
      :preseason => false
    ))
    assign(:seasons, Season.all)
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path(@game), :method => "post" do
      assert_select "select#game_season_id", :name => "game[season_id]"
      assert_select "option[value=#{season.id}]"
      assert_select "input#game_opponent", :name => "game[opponent]"
      assert_select "input#game_preseason", :name => "game[preseason]"
    end
  end
end
