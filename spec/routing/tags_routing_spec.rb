require "spec_helper"

describe TagsController do
  describe "routing" do

    describe "nested under /entities" do
      it "routes to #create" do
        post("/entities/123/tags/abc").should route_to("tags#create", :entity_id => "123", name: 'abc')
      end

      it "routes to #destroy" do
        delete("/entities/456/tags/def").should route_to("tags#destroy", :entity_id => "456", name: 'def')
      end
    end

  end
end
