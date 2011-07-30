require "spec_helper"

describe SeasonsController do
  describe "routing" do

    it "routes to #index" do
      get("/seasons").should route_to("seasons#index")
    end

    it "routes to #new" do
      get("/seasons/new").should route_to("seasons#new")
    end

    it "routes to #show" do
      get("/seasons/1").should route_to("seasons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/seasons/1/edit").should route_to("seasons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/seasons").should route_to("seasons#create")
    end

    it "routes to #update" do
      put("/seasons/1").should route_to("seasons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/seasons/1").should route_to("seasons#destroy", :id => "1")
    end

  end
end
