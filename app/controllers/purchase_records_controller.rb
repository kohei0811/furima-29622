class PurchaseRecordsController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @address_purchase = AddressPurchase.new
     if !user_signed_in?
      redirect_to new_user_session_path
     elsif @product_detail.purchase_record.present? || current_user.id == @product_detail.user_id
      redirect_to root_path
     end
  end

  def create
    @address_purchase = AddressPurchase.new(purchase_record_params)
     if @address_purchase.valid?
      pay_product
      @address_purchase.save
      return redirect_to root_path
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

  def set_product
    @product_detail = ProductDetail.find(params[:product_detail_id])
  end


end
