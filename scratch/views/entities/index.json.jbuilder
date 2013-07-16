json.array!(@entities) do |entity|
  json.extract! entity, :title, :note, :time, :date, :user_id
  json.url entity_url(entity, format: :json)
end
