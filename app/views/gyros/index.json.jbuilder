json.array!(@gyros) do |gyro|
  json.extract! gyro, :id, :user_id, :type, :tomato
  json.url gyro_url(gyro, format: :json)
end
