json.extract! article, :id, :title, :content, :fin, :created_at, :updated_at
json.url article_url(article, format: :json)
