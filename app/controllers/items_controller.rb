class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_param_set, only: [:edit, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:user_id, :title, :item_comment, :category_id, :price, :item_quality_id, :delivery_fee_id,
                                 :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def item_param_set
    @item = Item.find(params[:id])
  end

end
