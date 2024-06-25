class PagesController < ApplicationController
  def index
    render template: 'pages/trends'
  end

    def lk
        @user = current_user
        @favorites = @user.favorite_posts
      end

  def  search
     @items = PgSearch.multisearch(params['search'])
   end

  def stones;
    @post = Post.find(1)
  end

  def enter;end

  def history;end

  def jewelry;end

  def jewelrystory;end

  def post;end

  def publish;end

  def register;end

  def support;end

    def cartier;end

  def trends;end

  def zircon;end
end
