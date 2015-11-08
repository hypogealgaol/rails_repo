json.array!(@jeans) do |jean|
  json.extract! jean, :id, :maker, :denim
  json.url jean_url(jean, format: :json)
end
