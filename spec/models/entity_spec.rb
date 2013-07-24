require 'spec_helper'

describe Entity do
  let(:user) { create(:user) }
  let(:entity) { create(:entity, user: user) }

  describe '#name' do
    it 'is an alias for Entity#title' do
      entity.name.should eq(entity.title)
    end
  end

  describe "#has_user?" do
    let(:entity_user) { u = create(:user); entity.people << u; u }
    let(:other_user)  { u = create(:user); }

    it 'returns true if the passed user is the creator' do
      entity.has_user?(user).should be_true
    end

    it 'returns true if the passed user is included in .people' do
      entity.has_user?(entity_user).should be_true
    end

    it 'returns false otherwise' do
      entity.has_user?(other_user).should be_false
    end
  end
end
