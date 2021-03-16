class RopsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_user_check, only: [:index]
  before_action :rop_check, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @rop_to_address = RopToAddress.new
  end

  def create
    @rop_to_address = RopToAddress.new(rop_params)
    if @rop_to_address.valid?
      @rop_to_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def rop_params
    params.require(:rop_to_address).permit(:to_postal_code, :prefecture_id, :to_city, :to_address1, :to_address2, :to_telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_user_check
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def rop_check
    redirect_to root_path if @item.rop.present?
  end
end