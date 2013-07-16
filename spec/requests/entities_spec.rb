require 'spec_helper'

describe EntitiesController do
  describe "API" do
    # before do request.accept = 'application/json' end

    describe "POST /entities" do
      let(:entity) { entity = build(:entity).attributes }
        
      it "creates a new Entity" do
        expect {
          post entities_path, {format: :json, entity: entity}
        }.to change(Entity, :count).by(1)
        # response.status.should be(201)
        # JSON.parse(response.body)['title'].should eq('foo')
      end

      it "creates a new Entity" do
        pending 'broken on time'
        post entities_path, {format: :json, entity: entity}
        e = Entity.last
        e.title.should eq(entity['title'])
        e.note.should  eq(entity['note'])
        e.time.should  eq(entity['time'])
        e.date.should  eq(entity['date'])
      end
    end

    describe "POST /entities" do
      let(:entity) { entity = build(:entity).attributes }
        
      it "creates a new Entity" do
        expect {
          post entities_path, {format: :json, entity: entity}
        }.to change(Entity, :count).by(1)
        # response.status.should be(201)
        # JSON.parse(response.body)['title'].should eq('foo')
      end

      it "creates a new Entity" do
        pending 'broken on time'
        post entities_path, {format: :json, entity: entity}
        e = Entity.last
        e.title.should eq(entity['title'])
        e.note.should  eq(entity['note'])
        e.time.should  eq(entity['time'])
        e.date.should  eq(entity['date'])
      end
    end
  end
end
