json.array!(@store_bicycles) do |store_bicycle|
  json.extract! store_bicycle, :id, :store_id, :bicycle_id
  json.url store_bicycle_url(store_bicycle, format: :json)
end
