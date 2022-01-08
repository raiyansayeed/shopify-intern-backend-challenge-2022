json.extract! product, :id, :description, :seller_id, :name, :created_at, :updated_at
json.url product_url(product, format: :json)
