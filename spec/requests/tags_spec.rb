require 'pry'
require 'spec_helper'

describe "Tags" do
  let(:user)   { create(:user) }
  let(:entity) { create(:entity, user: user) }
  before(:each) do
    post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
  end

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
