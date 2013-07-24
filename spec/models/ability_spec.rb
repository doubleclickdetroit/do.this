require "spec_helper"
require "cancan/matchers"

describe "User" do
  describe "abilities" do
    context "logged in" do
      subject           { ability }
      let(:creator)     { create(:user) }
      let(:entity_user) { create(:user) }
      let(:entity)      { create(:entity, people: [entity_user]) }
      let(:other_user)  { create(:user) }

      context 'as Entity owner' do
        # let(:ability) { Ability.new(creator) }
        # it{ should be_able_to(:create, Entity) }
        # it{ should be_able_to(:read, entity) }
        # it{ should be_able_to(:update, entity) }
        # it{ should be_able_to(:destroy, entity) }
      end

      context 'through an EntityUser to the Entity' do
        let(:ability) { Ability.new(entity_user) }

        # it{ should be_able_to([:read, :update], entity) }
        # it{ should_not be_able_to([:destroy], entity) }
      end
    end
  end
end
