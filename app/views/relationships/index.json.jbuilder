json.array!(@relationships) do |relationship|
  json.extract! relationship, :user_id, :relatable
  json.url relationship_url(relationship, format: :json)
end
