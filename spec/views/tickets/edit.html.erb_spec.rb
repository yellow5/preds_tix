require 'spec_helper'

describe "tickets/edit.html.erb" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :game_id => 1,
      :ticket_holder_id => 1
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "input#ticket_game_id", :name => "ticket[game_id]"
      assert_select "input#ticket_ticket_holder_id", :name => "ticket[ticket_holder_id]"
    end
  end
end
