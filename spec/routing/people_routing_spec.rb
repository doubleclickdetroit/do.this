require "spec_helper"

describe PeopleController do
  describe "routing" do

    it "routes to #create" do
      post("/entities/123/people").should route_to("people#create", entity_id: '123')
    end

    it "routes to #destroy" do
      delete("/entities/456/people/789").should route_to("people#destroy", :entity_id => '456', user_id: '789')
    end

  end
end
