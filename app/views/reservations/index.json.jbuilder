json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :email, :date, :message, :restaurant
  json.url reservation_url(reservation, format: :json)
end
