class Api::V1::ItemsController < ApplicationController

  #protect_from_forgery except: :index
  protect_from_forgery with: :null_session
  respond_to :json

  def show
    item = Item.find(params[:id])
    Item.increment_counter(:visits, item.id)
    respond_with item
  end

  def index
    items = Item.page(params[:page]).order('visits DESC, created_at DESC')
    respond_with items do |format|
      format.json {
        render json: {
          total: items.total_entries,
          current_page: items.current_page,
          previous_page: items.previous_page,
          next_page: items.next_page,
          items: items
        }
      }
    end
  end

  def create
    item = Item.new(item_params)

    if item.save
      respond_with :api, :v1, item do |format|
        format.json { render json: item }
      end  
    else
      respond_with item  
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :description, :url)
  end

end