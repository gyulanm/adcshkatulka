class FavoritesController < ApplicationController
  def create
    @post = Post.find_by(slug: params[:post_slug])
    @favorite = current_user.favorites.build(post: @post)
    #render json: { message: @post }, status: :ok
    if @favorite.save
        redirect_to request.referer || root_path
    else
      flash[:alert] = 'Ошибка добавления в избранное'
         redirect_to request.referer || root_path
    end
  end

  def destroy
    @post = Post.find_by(slug: params[:post_slug])
    @favorite = current_user.favorites.find_by(post: @post)

    if @favorite
      @favorite.destroy
      redirect_to request.referer || root_path
    else
      flash[:alert] = 'Ошибка удаления из избранного'
      redirect_to request.referer || root_path
    end
  end
end
