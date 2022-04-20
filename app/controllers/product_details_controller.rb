class ProductDetailsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    if user_signed_in? && !current_user.id == @product_detail.user_id
      redirect_to root_path
    elsif @product_detail.purchase_record.present?
      redirect_to root_path
    end
  end

  def update
    if @product_detail.update(product_detail_params)
      redirect_to product_detail_path, method: :get
    else
     render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product_detail.user_id
      @product_detail.destroy
      redirect_to product_details_path, method: :get
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
