json.extract! comment, :id, :body, :post_id, :user, :created_at
json.url api_v1_comment_url(comment, format: :json)
