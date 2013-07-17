require 'spec_helper'
require 'pry'

describe TimelineController do
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

      it 'paginates 10 per request' do
        9.times do user.entities << create(:entity) end
        user.entities.count.should eq(11)

        get timeline_path, {format: :json}
        items = JSON.parse(response.body)
        items.count.should eq(10)

        get timeline_path, {format: :json, page: 2}
        items = JSON.parse(response.body)
        items.count.should eq(1)
      end
    end

    describe "GET /timeline/tag/:id" do
      it 'returns all Entities that have that Tag for the User' do
        entity             = create(:entity, user: user)
        other_user         = create(:user)
        other_entity       = create(:entity, user: user)
        other_users_entity = create(:entity, user: other_user)

        tag = create(:tag, user: user)
        entity.tags << tag

        get timeline_tag_path(tag.name), { format: :json }

        json = JSON.parse(response.body)
        json.count.should eq(1)
        json.first['title'].should eq(entity.title)
      end

      it 'paginates 10 per request' do
        user.entities.destroy_all

        tag_name = 'foobar'
        11.times do 
          e   = create(:entity, user: user)
          tag = create(:tag, name: tag_name, user: user, taggable: e)
        end
        user.tags.count.should eq(11)
        user.entities.count.should eq(11)
        Entity.count.should eq(12)

        get timeline_tag_path(tag_name), { format: :json }
        items = JSON.parse(response.body)
        items.count.should eq(10)

        get timeline_tag_path(tag_name), { format: :json, page: 2 }
        items = JSON.parse(response.body)
        items.count.should eq(1)
      end

      it 'throws an error if the User does not own the Tag'
    end
  end
end
