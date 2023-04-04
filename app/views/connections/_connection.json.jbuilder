json.extract! connection, :id, :type, :tag, :description, :origin, :created_at, :updated_at
json.url connection_url(connection, format: :json)
