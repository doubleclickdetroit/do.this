require 'spec_helper'

describe AssetList do
  let(:asset_list) { create(:asset_list) }
  subject { asset_list }

  it { should be_an(Entity) }
end
