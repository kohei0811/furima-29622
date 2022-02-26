class ProductDetailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product_detail = ProductDetail.new
  end

  def create
    @product_detail = ProductDetail.new(product_detail_params)
    if @product_detail.save
      redirect_to root_path
    else
     render :new
    end
  end

  private
  def product_detail_params
    params.require(:product_detail).permit(:image, :product_name, :product_explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end


end
