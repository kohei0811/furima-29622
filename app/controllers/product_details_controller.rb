class ProductDetailsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @product_details = ProductDetail.all.order("created_at DESC")
  end

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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @product_detail.user_id
      render :show
    end
  end

  def update
    if @product_detail.update(product_detail_params)
      redirect_to product_detail_path
    else
     render :edit
    end
  end

  private

  def product_detail_params
    params.require(:product_detail).permit(:image, :product_name, :product_explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product_detail = ProductDetail.find(params[:id])
  end

end
