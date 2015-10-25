json.array!(@room_types) do |room_type|
  json.extract! room_type, :id, :type_name
  json.url room_type_url(room_type, format: :json)
end
