require 'spec_helper'

describe "games/index.html.haml" do
  let(:season) { Season.create!(:years => '2011-12') }
  let(:puck_drop1) { 1.month.from_now }
  let(:puck_drop2) { 2.months.from_now }
  let(:game1) do
    Game.create!(
      :season_id => season.id,
      :opponent  => 'Calgary Flames',
      :puck_drop => puck_drop1,
      :preseason => true
    )
  end
  let(:game2) do
    Game.create!(
      :season_id => season.id,
      :opponent  => 'Boston Bruins',
      :puck_drop => puck_drop2,
      :preseason => false
    )
  end

  before(:each) do
    assign(:season, season)
    assign(:games, [game1, game2])
  end

  it 'displays season years in header' do
    render
    assert_select 'h1', :text => "#{season.years} Games"
  end

  it "renders a list of games" do
    render
    assert_select 'tr>td', :text => puck_drop1.to_s(:pretty), :count => 1
    assert_select "tr>td", :text => game1.opponent, :count => 1
    assert_select "tr>td", :text => 'Y', :count => 1
    assert_select 'tr>td', :text => puck_drop2.to_s(:pretty), :count => 1
    assert_select "tr>td", :text => game2.opponent, :count => 1
    assert_select 'tr>td', :text => '4', :count => 2
  end
end
