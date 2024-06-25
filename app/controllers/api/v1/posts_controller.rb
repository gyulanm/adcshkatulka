class Api::V1::PostsController < Api::V1::ApplicationController

  def index 
    @posts = Post.all

    # render :index
    # render json: @posts

    # render json: @posts.map { |post| post.api_as_json }
  end

  def show
    # @post = Post.find(params[:id])
    @post = Post.friendly.find(params[:id]) 
    # - что с френдли айди на этом этапе?
  end

  def create
    @user = User.find_by_jti(decrypt_payload[0]['jti'])
    @post = @user.posts.new(sti_post_params)

    if @post.save
      render json: @post.as_json
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @post.update(sti_post_params)
  #     format.json { render :show, status: :ok, location: @post }
  #   else
  #     format.json { render json: @post.errors, status: :unprocessable_entity }
  #   end
  # end

  # def destroy
  #   @post.destroy
  #   format.json { head :no_content }
  # end

  private
    def sti_post_params
        p = nil
        
      if params[:post]
        p = params.require(:post)
      elsif params[:idea_post]
        p = params.require(:idea_post)
      elsif params[:tutorial_post]
        p = params.require(:tutorial_post)
      end

      p.permit(:title, :type, :description, :post_image, :contetn_link, :tag_list, :created_at)
    end

end
