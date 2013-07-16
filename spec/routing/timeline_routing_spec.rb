require "spec_helper"

describe TimelineController do
  describe "routing" do

    it "routes to #me" do
      get("/timeline").should route_to("timeline#me")
    end

    it "routes to #stories" do
      get("/timeline/stories").should route_to("timeline#stories")
    end

    it "routes to #tag" do
      get("/timeline/tag/123").should route_to("timeline#tag", tag_id: '123')
    end

    it "routes to #person" do
      get("/timeline/person/456").should route_to("timeline#person", person_id: '456')
    end

  end
end
