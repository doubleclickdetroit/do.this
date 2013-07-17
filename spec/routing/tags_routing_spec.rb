require "spec_helper"

describe TagsController do
  describe "routing" do

    describe "nested under /entities" do
      it "routes to #create" do
        post("/entities/123/tags").should route_to("tags#create", :entity_id => "123")
      end

      it "routes to #destroy" do
        delete("/entities/456/tags/789").should route_to("tags#destroy", :entity_id => "456", :id => "789")
      end
    end

  end
end
