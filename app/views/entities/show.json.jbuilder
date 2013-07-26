json.extract! @entity, :title, :note, :time, :date, :user_id, :created_at, :updated_at

json.tags do
  json.array! @entity.tags.pluck(:name)
end

json.people do
  json.array! @entity.people do |user| 
    json.extract! user, :id, :name, :email
  end
end

json.comments do
  json.array! @entity.comments do |comment| 
    json.extract! comment, :id, :body, :created_at, :updated_at
  end
end
