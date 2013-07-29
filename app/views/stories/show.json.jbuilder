json.extract! @story, :title, :description, :created_at, :updated_at

json.tags do
  json.array! @story.tags.pluck(:name)
end

json.people do
  json.array! @story.people do |user| 
    json.extract! user, :id, :name, :email
  end
end
