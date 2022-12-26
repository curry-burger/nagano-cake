class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @item = Item.all
    @items = @item.page(params[:page]) #kaminari(ページネーション)導入のため
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end  
  end

  private
 # 投稿商品のストロングパラメーター
  def item_params
    params.require(:item).permit(:genre_id, :status, :name, :description, :price, :item_image)
  end
end
