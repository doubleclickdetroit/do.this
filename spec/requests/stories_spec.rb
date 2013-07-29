require 'spec_helper'

describe "Stories" do
  describe "POST /stories" do
    let(:story) { build(:story).attributes }
    let(:user)   { create(:user) }
    before(:each) do
      post user_session_path, { user: { email: user.email, password: 'asdfasdf' } }
    end

    it "creates a new Story" do
      expect {
        post stories_path, {format: :json, story: story}
      }.to change(Story, :count).by(1)
      # response.status.should be(201)
      # JSON.parse(response.body)['title'].should eq('foo')
    end

    it "creates a new Story" do
      post stories_path, {format: :json, story: story}
      e = Story.last
      e.title.should eq(story['title'])
      e.description.should  eq(story['description'])
    end

    it "sets the user to current_user on a new Story" do
      post stories_path, {format: :json, story: story}
      Story.last.user.should eq(user)
    end
  end

  describe "GET /stories/:id" do
    it "fetches an existing Story" do
      story = create(:story)

      get story_path(story), {format: :json}

      json = JSON.parse response.body
      json['title'].should eq(story.title)
    end

    it "includes tags and people with the Story" do
      tag1, tag2 = create(:tag), create(:tag)
      user1, user2 = create(:user), create(:user)
      story = create :story,
        tags: [tag1, tag2],
        people: [user1, user2]

      get story_path(story), {format: :json}

      json = JSON.parse response.body
      json['title'].should eq(story.title)

      json['tags'].should include(tag2.name)
      json['people'].last['name'].should eq(user2.name)
    end
  end

  describe "PUT/PATCH /stories/:id" do
    it "updates an existing Story" do
      story = create(:story)

      title = story.title + "foo"
      story.title.should_not eq(title)

      put story_path(story), {format: :json, story: {title: title}}
      story.reload
      story.title.should eq(title)

      title = story.title + "bar"
      story.title.should_not eq(title)

      patch story_path(story), {format: :json, story: {title: title}}
      story.reload
      story.title.should eq(title)
    end
  end

  describe "DELETE /stories/:id" do
    it "destroys an existing Story" do
      story = create(:story)

      expect {
        delete story_path(story), {format: :json}
      }.to change(Story, :count).by(-1)
    end
  end
end
