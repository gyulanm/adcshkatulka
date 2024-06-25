json.extract! post, :id, :title, :type, :description, :user, :created_at
json.post_image request.base_url + post.post_image.url
json.url api_v1_post_url(post, format: :json)

