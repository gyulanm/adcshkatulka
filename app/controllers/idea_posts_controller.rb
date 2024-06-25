class IdeaPostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]


  def show
    @recom_post1 = Post.find_by(id: "1")
    @title = "Шкатулка | #{@post.title}"
  end

  def new
    @post = IdeaPost.new
    @title = "Шкатулка | Новый пост"
  end

  def edit
    @title = "Шкатулка | Редактирование поста"
  end

  def create
    @post = Post.new(idea_post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to idea_post_url(@post), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(idea_post_params)
        format.html { redirect_to idea_post_url(@post), notice: "Пост успешно изменён" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to idea_posts_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def idea_post_params
      params.require(:idea_post).permit(:title, :type, :description, :post_image, :tag_list).merge(user_id: current_user.id)
    end
end
