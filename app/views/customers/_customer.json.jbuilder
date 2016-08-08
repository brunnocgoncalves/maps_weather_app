json.extract! customer, :id, :latitude, :longitude, :name, :address, :more_info, :age, :created_at, :updated_at
json.url customer_url(customer, format: :json)