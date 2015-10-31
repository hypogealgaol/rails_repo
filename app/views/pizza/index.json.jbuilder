json.array!(@pizzas) do |pizza|
  json.extract! pizza, :id, :type, :cheesy
  json.url pizza_url(pizza, format: :json)
end
