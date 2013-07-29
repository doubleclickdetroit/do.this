require 'spec_helper'

describe "People" do
  let(:user)   { create(:user) }
  let(:entity) { create(:entity, user: user) }
  let(:story)  { create(:story, user: user) }
  before(:each) do
    post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
  end
  let(:other_user) { create(:user) }

  context "for Entities" do
    describe "POST /entities/:entity_id/people" do
      it 'creates a new EntityUser for the Entity' do
        expect {
          post "/entities/#{entity.id}/people/#{other_user.id}", { format: :json }
        }.to change(EntityUser, :count).by(1)

        eu = entity.entity_users.last
        eu.should eq(EntityUser.last)
        eu.user.should eq(other_user)

        entity.people.should include(other_user)
      end

      it 'requires a user_id'

      it 'throws an error if the User does not own the Entity'
    end

    describe "DELETE /entities/:entity_id/people/:id" do
      it 'destroys the EntityUser for the Entity' do
        entity.people << other_user
        entity.reload.people.should include(other_user)

        expect {
          delete "/entities/#{entity.id}/people/#{other_user.id}", { format: :json }
        }.to change(EntityUser, :count).by(-1)
      end
      it 'throws an error if the User does not own the Entity'
    end
  end

  context "for Stories" do
    describe "POST /stories/:story_id/people" do
      it 'creates a new StoryUser for the Story' do
        pending
        expect {
          post story_people_path(story), { format: :json, user_id: user.id }
        }.to change(StoryUser, :count).by(1)

        eu = story.story_users.last
        eu.should eq(StoryUser.last)
        eu.user.should eq(user)

        story.people.should include(user)
      end

      it 'requires a user_id'

      it 'throws an error if the User does not own the Story'
    end

    describe "DELETE /stories/:story_id/people/:id" do
      it 'destroys the StoryUser for the Story' do
        pending
        story.people << user
        story.reload.people.should include(user)

        expect {
          delete story_person_path(story, user.id), { format: :json }
        }.to change(StoryUser, :count).by(-1)
      end
      it 'throws an error if the User does not own the Story'
    end
  end
end
