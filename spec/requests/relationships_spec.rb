require 'spec_helper'

describe "Relationships" do
  let(:user)   { create(:user) }
  let(:entity) { create(:entity, user: user) }
  before(:each) do
    post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
  end

  describe "POST /entities/:entity_id/relationships" do
    it 'creates a new Relationship for the Entity' do
      relationship = { user_id: user.id }

      expect {
        post entity_relationships_path(entity), { format: :json, relationship: relationship }
      }.to change(Relationship, :count).by(1)

      entity.relationships.last.should eq(Relationship.last)
    end

    it 'throws an error if the User does not own the Entity'
  end

  describe "DELETE /entities/:entity_id/relationships/:id" do
    it 'destroys the Relationship for the Entity' do
      pending
      # delete entity_relationships_path(entity, relationship), { format: :json, relationship: {} }
    end
    it 'throws an error if the User does not own the Entity'
  end
end
