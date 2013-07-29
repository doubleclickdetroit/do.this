json.extract! @story, :title, :description, :created_at, :updated_at

json.tags do
  json.array! @story.tags.pluck(:name)
end
