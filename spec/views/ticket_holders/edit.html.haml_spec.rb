require 'spec_helper'

describe "ticket_holders/edit" do
  let!(:season) { Season.create! }

  before(:each) do
    @ticket_holder = assign(:ticket_holder, stub_model(TicketHolder,
      :season_id => 1,
      :name => "MyString"
    ))
    assign(:seasons, Season.all)
  end

  it 'displays ticket holder name in header' do
    render
    rendered.should match("Editing Ticket Holder - #{@ticket_holder.name}")
  end

  it "renders the edit ticket_holder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ticket_holders_path(@ticket_holder), :method => "post" do
      assert_select "select#ticket_holder_season_id", :name => "ticket_holder[season_id]"
      assert_select "option[value=#{season.id}]"
      assert_select "input#ticket_holder_name", :name => "ticket_holder[name]"
    end
  end
end
