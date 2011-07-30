require 'spec_helper'

describe "ticket_holders/show.html.erb" do
  before(:each) do
    @ticket_holder = assign(:ticket_holder, stub_model(TicketHolder,
      :season_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
