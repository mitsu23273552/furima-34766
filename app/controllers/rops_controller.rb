class RopsController < ApplicationController
  def index
    @rop = Rop.new
    @item = Item.find(params[:item_id])
  end
end
