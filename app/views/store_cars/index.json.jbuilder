json.array!(@store_cars) do |store_car|
  json.extract! store_car, :id, :store_id, :car_id
  json.url store_car_url(store_car, format: :json)
end
