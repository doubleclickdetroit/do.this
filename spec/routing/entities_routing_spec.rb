require "spec_helper"

describe EntitiesController do
  describe "routing" do

    it "routes to #create" do
      post("/entities").should route_to("entities#create")
    end

    it "routes to #update" do
      put("/entities/1").should route_to("entities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/entities/1").should route_to("entities#destroy", :id => "1")
    end

    it "routes to #show" do
      get("/entities/1").should route_to("entities#show", :id => "1")
    end

    # UNUSED
    it "routes to #index" do
      expect{
        get("/entities").should route_to("entities#index")
      }.to raise_error
    end

    it "routes to #new" do
      expect{
        get("/entities/new").should route_to("entities#new")
      }.to raise_error
    end

    it "routes to #edit" do
      expect{
        get("/entities/1/edit").should route_to("entities#edit", :id => "1")
      }.to raise_error
    end

  end
end
