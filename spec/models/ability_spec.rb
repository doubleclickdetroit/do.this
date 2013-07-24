require "spec_helper"
require "cancan/matchers"

describe "User" do
  describe "abilities" do
    context "logged in" do
      context 'as Entity owner' do
        subject       { ability }
        let(:ability) { Ability.new(user) }
        let(:user)    { create(:user) }

        it{ should be_able_to(:crud, Entity) }
      end

      # context 'through a Relationship to the Entity' do
      #   let(:ability) { Ability.new(user) }
      #   let(:user)    { create(:user) }
      #   let(:entity)  { create(:entity, users: [user]) }

      #   it{ should be_able_to([:read, :update], entity) }
      #   it{ should_not be_able_to([:destroy], entity) }
      # end
    end
  end
end
