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

    context 'nested under /stories' do

      it "routes to #create" do
        post("/stories/2/entities").should route_to("entities#create", :story_id => "2")
      end

      it "routes to #update" do
        put("/stories/2/entities/1").should route_to("entities#update", :story_id => "2", :id => "1")
      end

      it "routes to #destroy" do
        delete("/stories/2/entities/1").should route_to("entities#destroy", :story_id => "2", :id => "1")
      end

      it "routes to #show" do
        get("/stories/2/entities/1").should route_to("entities#show", :story_id => "2", :id => "1")
      end
    end

  end
end
