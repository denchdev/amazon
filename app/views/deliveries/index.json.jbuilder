json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :name, :price
  json.url delivery_url(delivery, format: :json)
end
