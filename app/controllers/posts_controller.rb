class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[ show edit update destroy ]

   def search
       query = params[:query]
       results = PgSearch.multisearch(query)
       render json: results.map { |result| result.searchable }
   end

  def show
    @title = "Шкатулка | #{@post.title}"
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(sti_post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(sti_post_params)
        format.html { redirect_to post_url(@post), notice: "Пост успешно изменён" }
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
      format.html { redirect_to posts_url, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :content_link, :type)
    end

    def sti_post_params
        p = nil
        
      if params[:post]
        p = params.require(:post)
      elsif params[:idea_post]
        p = params.require(:idea_post)
      elsif params[:tutorial_post]
        p = params.require(:tutorial_post)
      end

      p.permit(:title, :type, :description, :post_image, :contetn_link, :tag_list, :created_at).merge(user_id: current_user.id)
    end
end
