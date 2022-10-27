json.extract! post, :id, :title, :url, :summary, :body, :image, :account_id, :created_at, :updated_at
json.url post_url(post, format: :json)
