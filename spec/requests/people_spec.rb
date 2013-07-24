require 'spec_helper'

describe "People" do
  context "for Entities" do
    let(:user)   { create(:user) }
    let(:entity) { create(:entity, user: user) }
    before(:each) do
      post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
    end


    describe "POST /entities/:entity_id/people" do
      it 'creates a new EntityUser for the Entity' do
        expect {
          post entity_people_path(entity), { format: :json, user_id: user.id }
        }.to change(EntityUser, :count).by(1)

        eu = entity.entity_users.last
        eu.should eq(EntityUser.last)
        eu.user.should eq(user)

        entity.people.should include(user)
      end

      it 'requires a user_id'

      it 'throws an error if the User does not own the Entity'
    end

    describe "DELETE /entities/:entity_id/people/:id" do
      it 'destroys the EntityUser for the Entity' do
        entity.people << user
        entity.reload.people.should include(user)

        expect {
          delete entity_person_path(entity, user.id), { format: :json }
        }.to change(EntityUser, :count).by(-1)
      end
      it 'throws an error if the User does not own the Entity'
    end
  end
end
