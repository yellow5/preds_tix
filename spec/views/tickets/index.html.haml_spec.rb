require 'spec_helper'

describe "tickets/index.html.erb" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :game_id => 1,
        :ticket_holder_id => 2
      ),
      stub_model(Ticket,
        :game_id => 1,
        :ticket_holder_id => 2
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
