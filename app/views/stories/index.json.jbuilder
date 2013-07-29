json.array!(@stories) do |story|
  json.extract! story, :title, :description
  json.url story_url(story, format: :json)
end
