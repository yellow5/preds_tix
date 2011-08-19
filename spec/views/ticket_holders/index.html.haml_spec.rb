require 'spec_helper'

describe "ticket_holders/index.html.haml" do
  before(:each) do
    assign(:ticket_holders, [
      stub_model(TicketHolder,
        :season_id => 1,
        :name => "Name"
      ),
      stub_model(TicketHolder,
        :season_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of ticket_holders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
