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
    end
  end
end
