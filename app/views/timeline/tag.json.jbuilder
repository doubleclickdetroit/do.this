json.array! @items do |item|
  # strictly entities for right now
  json.extract! item, :title, :note, :time, :date, :created_at, :updated_at
  json.user do 
    json.extract! item.user, :id, :email
  end
end
