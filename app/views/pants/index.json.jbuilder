json.array!(@pants) do |pant|
  json.extract! pant, :id, :maker, :quality
  json.url pant_url(pant, format: :json)
end
