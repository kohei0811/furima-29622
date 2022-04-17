class PurchaseRecordsController < ApplicationController

  def index
    @product_detail = ProductDetail.find(params[:product_detail_id])
    @address_purchase = AddressPurchase.new
  end

  def create
    @product_detail = ProductDetail.find(params[:product_detail_id])
    @address_purchase = AddressPurchase.new(purchase_record_params)
     if @address_purchase.valid?
      pay_product
      @address_purchase.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private

  def purchase_record_params
    params.require(:address_purchase).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, product_detail_id: params[:product_detail_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product_detail[:price],
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end


end
