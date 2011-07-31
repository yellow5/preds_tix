require 'spec_helper'

describe "games/index.html.erb" do
  let(:season) { Season.create!(:years => '2011-12') }

  before(:each) do
    assign(:season, season)
    assign(:games, [
      stub_model(Game,
        :opponent => "Opponent",
        :preseason => false
      ),
      stub_model(Game,
        :opponent => "Opponent",
        :preseason => false
      )
    ])
  end

  it 'displays season years in header' do
    render
    assert_select 'h1', :text => "#{season.years} Games"
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Opponent".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
