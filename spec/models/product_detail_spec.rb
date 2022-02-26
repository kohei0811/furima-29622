require 'rails_helper'

RSpec.describe ProductDetail, type: :model do
  before do
    @product_detail = FactoryBot.build(:product_detail)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'product_nameとproduct_explanation、category_id、status_id、delivery_fee_id、prefecture_id、days_to_ship_id、price、image、userが存在していれば保存できる' do
        expect(@product_detail).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では保存できない' do
        @product_detail.image = nil
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では保存できない' do
        @product_detail.product_name = ''
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explanationが空では保存できない' do
        @product_detail.product_explanation = ''
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Product explanation can't be blank")
      end
      it 'category_idが空では保存できない' do
        @product_detail.category_id = '1'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では保存できない' do
        @product_detail.status_id = '1'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_fee_idが空では保存できない' do
        @product_detail.delivery_fee_id = '1'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @product_detail.prefecture_id = '1'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_ship_idが空では保存できない' do
        @product_detail.days_to_ship_id = '1'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では保存できない' do
        @product_detail.price = ''
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できない' do
        @product_detail.price = '100'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では保存できない' do
        @product_detail.price = '11111111'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外では保存できない' do
        @product_detail.price = 'aaaa'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角数字以外では保存できない' do
        @product_detail.price = 'ああああ'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角数字以外では保存できない' do
        @product_detail.price = '11１１'
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと保存できない' do
        @product_detail.user = nil
        @product_detail.valid?
        expect(@product_detail.errors.full_messages).to include('User must exist')
      end
    end
  end
end