require 'spec_helper'

describe TimelineController do

  describe "GET 'me'" do
    it "returns http success" do
      get 'me'
      response.should be_success
    end
  end

  describe "GET 'tag'" do
    it "returns http success" do
      get 'tag'
      response.should be_success
    end
  end

  describe "GET 'person'" do
    it "returns http success" do
      get 'person'
      response.should be_success
    end
  end

  describe "GET 'stories'" do
    it "returns http success" do
      get 'stories'
      response.should be_success
    end
  end

end
