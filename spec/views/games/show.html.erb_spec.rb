require 'spec_helper'

describe "games/show.html.erb" do
  let(:puck_drop) { 2.months.from_now }

  before(:each) do
    @game = assign(:game, stub_model(Game,
      :season_id => 1,
      :opponent  => "Opponent",
      :preseason => false,
      :puck_drop => puck_drop
    ))
  end

  it 'displays puck_drop and opponent in header' do
    render
    rendered.should match("#{@game.puck_drop.to_s(:pretty)} - #{@game.opponent}")
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Opponent/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
