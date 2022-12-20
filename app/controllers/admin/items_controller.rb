class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])  #kaminari(ページネーション)導入のため
    # @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private
 # 投稿商品のストロングパラメーター
  def item_params
    params.require(:item).permit(:genre_id, :status, :name, :description, :price, :item_image)
  end
end
