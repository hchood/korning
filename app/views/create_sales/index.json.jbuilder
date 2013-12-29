json.array!(@create_sales) do |create_sale|
  json.extract! create_sale, :id
  json.url create_sale_url(create_sale, format: :json)
end
