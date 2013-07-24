require 'spec_helper'

describe "Comments" do
  let(:user)   { create(:user) }
  let(:entity) { create(:entity, user: user) }
  before(:each) do
    post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
  end

  describe "POST /entities/:entity_id/comments" do
    it 'adds a Comment to an existing Entity' do
      comment        = build(:comment).attributes
      comment_params = { format: :json, comment: comment }

      expect {
        post entity_comments_path(entity), comment_params
      }.to change(Comment, :count).by(1)
      
      entity.comments.last.body.should eq(comment['body'])
      entity.comments.last.user.should eq(user)
    end

    it 'throws an error if the User does not own the Entity'
  end

  describe "PUT /entities/:entity_id/comments/:id" do
    it 'updates the Comment body for an existing Comment' do
      comment        = create(:comment, entity: entity, user: user)
      body           = comment.body.next
      comment_params = { body: body }

      expect {
        put entity_comment_path(entity, comment), { format: :json, comment: comment_params }
      }.to change(Comment, :count).by(0)
      
      entity.comments.last.body.should eq(body)
      entity.comments.last.user.should eq(user)
    end

    it 'throws an error if the User does not own the Comment'
  end

  describe "DELETE /entities/:entity_id/comments/:id" do
    it 'removes a Comment from an existing Entity' do
      comment = create(:comment, entity: entity, user: user)
      entity.comments << comment
      entity.comments.count.should eq(1)

      expect {
        delete entity_comment_path(entity, comment), { format: :json }
      }.to change(Comment, :count).by(-1)
      
      entity.reload.comments.count.should eq(0)
    end

    it 'throws an error if the User does not own the Comment'
  end
end
