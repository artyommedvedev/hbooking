json.array!(@bookings) do |booking|
  json.extract! booking, :id, :number, :begining, :ending, :cost
  json.url booking_url(booking, format: :json)
end
