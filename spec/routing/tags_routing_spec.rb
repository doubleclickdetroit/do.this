require "spec_helper"

describe TagsController do
  describe "routing" do

    describe "nested under /timeline" do
      it "routes to #show" do
        get("/timeline/tag/1234").should route_to("tags#show", :id => "1", :id => "1234")
      end
    end

    describe "nested under /entities" do
      it "routes to #create" do
        post("/entities/123/tags").should route_to("tags#create", :entity_id => "123")
      end

      it "routes to #destroy" do
        delete("/entities/456/tags/789").should route_to("tags#destroy", :entity_id => "456", :id => "789")
      end
    end

    # it "routes to #index" do
    #   get("/tags").should route_to("tags#index")
    # end

    # it "routes to #new" do
    #   get("/tags/new").should route_to("tags#new")
    # end

    # it "routes to #edit" do
    #   get("/tags/1/edit").should route_to("tags#edit", :id => "1")
    # end

    # it "routes to #update" do
    #   put("/tags/1").should route_to("tags#update", :id => "1")
    # end

  end
end
