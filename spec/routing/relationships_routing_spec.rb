require "spec_helper"

describe RelationshipsController do
  describe "routing" do
    describe 'nested under /entities' do

      it "routes to #create" do
        post("/entities/123/relationships").should route_to("relationships#create", :entity_id => "123")
      end

      it "routes to #destroy" do
        delete("/entities/456/relationships/789").should route_to("relationships#destroy", :entity_id => "456", :id => "789")
      end

    end
  end
end
