json.extract! property,
              :id,
              :name,
              :address,
              :price,
              :rooms,
              :square_meters,
              :bathrooms,
              :created_at,
              :updated_at
json.url property_url(property, format: :json)
