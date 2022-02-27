class UsersController < ApplicationController
  def index
    @product_details = ProductDetail.all
  end
end
