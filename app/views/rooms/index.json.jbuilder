json.array!(@rooms) do |room|
  json.extract! room, :id, :number, :type_id, :price, :status
  json.url room_url(room, format: :json)
end
