require "spec_helper"

describe TicketHoldersController do
  describe "routing" do

    it "routes to #index" do
      get("/ticket_holders").should route_to("ticket_holders#index")
    end

    it "routes to #new" do
      get("/ticket_holders/new").should route_to("ticket_holders#new")
    end

    it "routes to #show" do
      get("/ticket_holders/1").should route_to("ticket_holders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ticket_holders/1/edit").should route_to("ticket_holders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ticket_holders").should route_to("ticket_holders#create")
    end

    it "routes to #update" do
      put("/ticket_holders/1").should route_to("ticket_holders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ticket_holders/1").should route_to("ticket_holders#destroy", :id => "1")
    end

  end
end
