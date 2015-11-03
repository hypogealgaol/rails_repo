json.array!(@jeans) do |jeans|
  json.extract! jeans, :id, :maker, :denim, :color
  json.url jeans_url(jeans, format: :json)
end
