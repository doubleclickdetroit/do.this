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

    describe "PUT/PATCH /entities" do
      it "updates an existing Entity" do
        entity = create(:entity)
        
        title = entity.title + "foo"
        entity.title.should_not eq(title)

        put entity_path(entity), {format: :json, entity: {title: title}}
        entity.reload
        entity.title.should eq(title)

        title = entity.title + "bar"
        entity.title.should_not eq(title)

        patch entity_path(entity), {format: :json, entity: {title: title}}
        entity.reload
        entity.title.should eq(title)
      end
    end

    describe "DELETE /entities" do
      it "destroys an existing Entity" do
        entity = create(:entity)

        expect {
          delete entity_path(entity), {format: :json}
        }.to change(Entity, :count).by(-1)
      end
    end
  end
end
