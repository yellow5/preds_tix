require 'spec_helper'

describe "ticket_holders/show.html.erb" do
  let(:season) { Season.create!(:years => '2011-12') }
  let(:ticket_holder) { TicketHolder.create!(:season_id => season.id, :name => 'Obiwan') }
  let(:puck_drop1) { 1.month.from_now }
  let(:puck_drop2) { 2.months.from_now }
  let(:game1) do
    Game.create!(
      :season_id => season.id,
      :opponent  => 'Calgary Flames',
      :puck_drop => puck_drop1,
      :preseason => true
    ).tap do |game|
      game.tickets[0].update_attributes!(:ticket_holder_id => ticket_holder.id)
      game.tickets[1].update_attributes!(:ticket_holder_id => ticket_holder.id)
    end
  end
  let(:game2) do
    Game.create!(
      :season_id => season.id,
      :opponent  => 'Boston Bruins',
      :puck_drop => puck_drop2,
      :preseason => false
    ).tap do |game|
      game.tickets.each do |ticket|
        ticket.update_attributes!(:ticket_holder_id => ticket_holder.id)
      end
    end
  end

  before(:each) do
    assign(:ticket_holder, ticket_holder)
    assign(:games, [game1, game2])
  end

  it 'displays name and season years in header' do
    render
    assert_select 'h1', :text => "#{ticket_holder.name}'s Games in #{season.years}"
  end

  it "renders a list of ticket holder's games" do
    render
    assert_select 'tr>td', :text => puck_drop1.to_s(:pretty), :count => 1
    assert_select 'tr>td', :text => game1.opponent, :count => 1
    assert_select 'tr>td', :text => 'Y', :count => 1
    assert_select 'tr>td', :text => '2', :count => 1
    assert_select 'tr>td', :text => puck_drop2.to_s(:pretty), :count => 1
    assert_select 'tr>td', :text => game2.opponent, :count => 1
    assert_select 'tr>td', :text => '4', :count => 1
  end
end
