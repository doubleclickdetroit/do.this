require 'spec_helper'

describe EntitiesController do
  describe "API" do
    # before do request.accept = 'application/json' end

    describe "POST /entities" do
      let(:entity) { build(:entity).attributes }
      let(:user)   { create(:user) }
      before(:each) do
        post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
      end
        
      it "creates a new Entity" do
        expect {
          post entities_path, {format: :json, entity: entity}
        }.to change(Entity, :count).by(1)
        # response.status.should be(201)
        # JSON.parse(response.body)['title'].should eq('foo')
      end

      it "creates a new Entity" do
        pending 'broken on time'
        post entities_path, {format: :json, entity: entity}
        e = Entity.last
        e.title.should eq(entity['title'])
        e.note.should  eq(entity['note'])
        e.time.should  eq(entity['time'])
        e.date.should  eq(entity['date'])
      end

      it "creates a new Entity for a Story" do
        story = create(:story, user: user)

        Entity.count.should eq(0)

        post story_entities_path(story), {format: :json, entity: entity}

        Entity.last.story.should eq(story)
      end

      it "sets the user to current_user on a new Entity" do
        post entities_path, {format: :json, entity: entity}
        Entity.last.user.should eq(user)
      end
    end

    describe "GET /entities/:id" do
      it "fetches an existing Entity" do
        entity = create(:entity)
        
        get entity_path(entity), {format: :json}

        json = JSON.parse response.body
        json['title'].should eq(entity.title)
      end

      it "includes tags, people, and comments with the Entity" do
        tag1, tag2 = create(:tag), create(:tag)
        comment1, comment2 = create(:comment), create(:comment)
        user1, user2 = create(:user), create(:user)
        entity = create :entity,
          tags: [tag1, tag2],
          people: [user1, user2],
          comments: [comment1, comment2]
        
        get entity_path(entity), {format: :json}

        json = JSON.parse response.body
        json['title'].should eq(entity.title)

        json['tags'].should include(tag2.name)
        json['comments'].last['body'].should eq(comment2.body)
        json['people'].last['name'].should eq(user2.name)
      end
    end

    describe "PUT/PATCH /entities/:id" do
      let(:user)   { create(:user) }
      before(:each) do
        post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
      end

      it "updates an existing Entity" do
        entity = create(:entity)
        
        title = entity.title + "foo"
        entity.title.should_not eq(title)

        put entity_path(entity), {format: :json, entity: {title: title}}
        entity.reload
        entity.title.should eq(title)

        title = entity.title + "bar"
        entity.title.should_not eq(title)

        patch entity_path(entity), {format: :json, entity: {title: title}}
        entity.reload
        entity.title.should eq(title)
      end

      it "updates Story for existing Entity" do
        story1 = create(:story, user: user)
        story2 = create(:story, user: user)
        entity = create(:entity, user: user)
        
        put entity_path(entity), {format: :json, entity: {story_id: story1.id}}
        entity.reload
        entity.story.should eq(story1)

        patch entity_path(entity), {format: :json, entity: {story_id: story2.id}}
        entity.reload
        entity.story.should eq(story2)

        # remove from story
        put story_entity_path(story1, entity), {format: :json, entity: {story_id: nil}}
        entity.reload
        entity.story.should eq(nil)
      end
    end

    describe "DELETE /entities/:id" do
      it "destroys an existing Entity" do
        entity = create(:entity)

        expect {
          delete entity_path(entity), {format: :json}
        }.to change(Entity, :count).by(-1)
      end
    end
  end
end
