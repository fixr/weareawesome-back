class ItemsController < ApplicationController

  #protect_from_forgery except: :index
  protect_from_forgery with: :null_session
  respond_to :html, :json

  def show
    item = Item.find(params[:id])
    Item.increment_counter(:visits, item.id)
    if item.url
      redirect_to item.url
    else
      respond_with item
    end
  end

end