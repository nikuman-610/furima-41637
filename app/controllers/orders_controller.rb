class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @purchase_record_address = PurchaseRecordAddress.new
  end
  
  def create
    @purchase_record_address = PurchaseRecordAddress.new(order_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:purchase_record_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).marge(item_id: params[:item_id], user_id: current_user.id)
  end
end
