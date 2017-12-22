json.array!(@bicycles) do |bicycle|
  json.extract! bicycle, :id, :name, :price, :image
  json.url bicycle_url(bicycle, format: :json)
end
