require 'pry'
require 'spec_helper'

describe "Tags" do
  let(:user)   { create(:user) }
  let(:entity) { create(:entity, user: user) }
  let(:story)  { create(:story, user: user) }
  before(:each) do
    post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
  end

  context 'entities' do
    describe "POST /entities/:entity_id/tags" do
      it 'adds a Tag to an existing Entity' do
        tag        = build(:tag).attributes
        # tag_params = { format: :json, tag: tag }
        tag_params = { format: :json }

        expect {
          post "/entities/#{entity.id}/tags/#{tag['name']}", tag_params
        }.to change(Tag, :count).by(1)

        entity.tags.last.name.should eq(tag['name'])
      end

      it 'throws an error if the User does not own the Entity'
    end

    describe "DELETE /entities/:entity_id/tags/:id" do
      it 'removes a Tag from an existing Entity' do
        tag = create(:tag, user: user)
        entity.tags << tag
        entity.tags.count.should eq(1)

        expect {
          delete "/entities/#{entity.id}/tags/#{tag.name}", { format: :json }
        }.to change(Tag, :count).by(-1)

        entity.reload.tags.count.should eq(0)
      end

      it 'throws an error if the User does not own the Entity'
    end
  end

  context 'stories' do
    describe "POST /stories/:story_id/tags" do
      it 'adds a Tag to an existing Story' do
        tag        = build(:tag).attributes
        # tag_params = { format: :json, tag: tag }
        tag_params = { format: :json }

        expect {
          post "/stories/#{story.id}/tags/#{tag['name']}", tag_params
        }.to change(Tag, :count).by(1)

        story.tags.last.name.should eq(tag['name'])
      end

      it 'throws an error if the User does not own the Story'
    end

    describe "DELETE /stories/:story_id/tags/:id" do
      it 'removes a Tag from an existing Story' do
        tag = create(:tag, user: user)
        story.tags << tag
        story.tags.count.should eq(1)

        expect {
          delete "/stories/#{story.id}/tags/#{tag.name}", { format: :json }
        }.to change(Tag, :count).by(-1)

        story.reload.tags.count.should eq(0)
      end

      it 'throws an error if the User does not own the Story'
    end
  end

end
