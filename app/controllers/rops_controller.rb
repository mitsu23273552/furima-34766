class RopsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_user_check, only: [:index]
  before_action :rop_check, only: [:index]

  def index
    @rop_to_address = RopToAddress.new
  end

  def create
    @rop_to_address = RopToAddress.new(rop_params)
    if @rop_to_address.valid?
      pay_item
      @rop_to_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def rop_params
    params.require(:rop_to_address).permit(:to_postal_code, :prefecture_id, :to_city, :to_address1, :to_address2, :to_telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: rop_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_user_check
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def rop_check
    redirect_to root_path if @item.rop.present?
  end
end
