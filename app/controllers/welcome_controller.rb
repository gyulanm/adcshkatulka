class WelcomeController < ApplicationController
  def index
    # Meta
    @title = "Шкатулка"
    # end

    @recom_post1 = Post.find_by(id: "1")

    # ActionCable.server.broadcast("notifications_channel", { body: "LOOCHOK" })
  end

  def search
    @items = PgSearch.multisearch(params['search'])
  end
end
