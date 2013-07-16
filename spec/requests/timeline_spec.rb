require 'spec_helper'

describe EntitiesController do
  describe "API" do
    # before do request.accept = 'application/json' end
    
    let(:user) { create(:user) }

    before(:each) do
      post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }

      other_user = create(:user)

      create(:entity, user: user)
      create(:entity, user: user)

      create(:entity, user: other_user)
    end

    describe "GET /timeline" do
      it "returns all Entities belonging to current_user" do
        get timeline_path, {format: :json}
        items = JSON.parse(response.body)
        
        items.count.should eq(2)
        items.all?{|item| item['user']['id'] == user.id}
      end
    end
  end
end
