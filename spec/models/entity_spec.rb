require 'spec_helper'

describe Entity do
  let(:user) { create(:user) }
  let(:entity) { create(:entity, user: user) }

  describe '#name' do
    it 'is an alias for Entity#title' do
      entity.name.should eq(entity.title)
    end
  end
end
