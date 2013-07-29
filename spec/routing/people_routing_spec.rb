require "spec_helper"

describe PeopleController do
  describe "routing" do

    context 'nested under /entities' do
      it "routes to #create" do
        post("/entities/123/people/012").should route_to("people#create", entity_id: '123', user_id: '012')
      end

      it "routes to #destroy" do
        delete("/entities/456/people/789").should route_to("people#destroy", :entity_id => '456', user_id: '789')
      end
    end

    context 'nested under /stories' do
      it "routes to #create" do
        post("/stories/123/people/012").should route_to("people#create", story_id: '123', user_id: '012')
      end

      it "routes to #destroy" do
        delete("/stories/456/people/789").should route_to("people#destroy", :story_id => '456', user_id: '789')
      end
    end

  end
end
