class Api::V1::CommentsController < Api::V1::ApplicationController

  # load_and_authorize_resource
  # before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @user = User.find_by_jti(decrypt_payload[0]['jti'])
    @comment = @user.comments.new(comment_params)

    ActionCable.server.broadcast("notifications_#{@post.user.id}", { text: "New comment for your post", type: "Post", id: @post.id })

    if @comment.save
      render json: @comment.as_json
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
