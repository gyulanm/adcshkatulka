json.set! :posts do
    json.array! @posts, partial: "api/v1/posts/post", as: :post
end
