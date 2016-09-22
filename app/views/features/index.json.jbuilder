json.array!(@features) do |feature|
  json.extract! feature, :id, :name
  json.url feature_url(feature, format: :json)
end
