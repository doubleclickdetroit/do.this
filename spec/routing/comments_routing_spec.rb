require "spec_helper"

describe CommentsController do
  describe "routing" do

    it "routes to #create" do
      post("/entities/123/comments").should route_to("comments#create", entity_id: '123')
    end

    it "routes to #update" do
      put("/entities/123/comments/1").should route_to("comments#update", :id => "1", entity_id: '123')
    end

    it "routes to #destroy" do
      delete("/entities/123/comments/1").should route_to("comments#destroy", :id => "1", entity_id: '123')
    end

  end
end
