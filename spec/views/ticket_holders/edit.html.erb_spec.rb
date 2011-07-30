require 'spec_helper'

describe "ticket_holders/edit.html.erb" do
  before(:each) do
    @ticket_holder = assign(:ticket_holder, stub_model(TicketHolder,
      :season_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit ticket_holder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ticket_holders_path(@ticket_holder), :method => "post" do
      assert_select "input#ticket_holder_season_id", :name => "ticket_holder[season_id]"
      assert_select "input#ticket_holder_name", :name => "ticket_holder[name]"
    end
  end
end
