require 'spec_helper'

describe "tickets/edit" do
  let(:game) { Game.create!(:opponent => 'Boston Bruins') }
  let!(:ticket) { game.tickets.first }

  before(:each) do
    assign(:ticket, ticket)
  end

  it 'displays opponent in header' do
    render
    render.should match("Editing #{ticket.game.opponent} Ticket")
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(ticket), :method => "post" do
      assert_select "input#ticket_game_id", :name => "ticket[game_id]"
      assert_select "input#ticket_ticket_holder_id", :name => "ticket[ticket_holder_id]"
    end
  end
end
