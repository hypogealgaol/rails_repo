json.array!(@sandwiches) do |sandwich|
  json.extract! sandwich, :id
  json.url sandwich_url(sandwich, format: :json)
end
