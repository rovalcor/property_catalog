json.array!(@properties) do |property|
  json.extract! property, :id, :title, :property_type, :description
  json.url property_url(property, format: :json)
end
