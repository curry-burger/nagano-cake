class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @ganre = Ganre.all
  end
  
  def new
    @item = Item.new
    # ganre = Ganre.new
  end
  
  def create
    @item = Item.new(item_params)
    # @item.admin_id = current_admin.id
    @item.save
    redirect_to admin_items_path
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
 
  private
   # 投稿商品のストロングパラメーター
  def item_params
    params.require(:item).permit(:item_image, :name, :description, :price)
  end
end
