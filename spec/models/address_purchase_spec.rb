require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  describe '商品出品' do
    context '商品が購入できる場合' do
      it 'post_codeとprefecture_id、municipality、address、phone_number、token、user＿id、product＿detail＿idが存在していれば保存できる' do
        expect(@address_purchase).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @address_purchase.building_name = ''
        expect(@address_purchase).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空では購入できない' do
        @address_purchase.post_code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれていないと購入できない' do
        @address_purchase.post_code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post code はハイフンを含む必要があります")
      end
      it 'prefecture_idが空では購入できない' do
        @address_purchase.prefecture_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @address_purchase.municipality = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @address_purchase.address = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @address_purchase.phone_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフン無しの11桁でないと購入できない' do
        @address_purchase.phone_number = '123-4567891'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number はハイフン無しの10桁か11桁である必要があります")
      end
      it 'phone_numberは9桁以下では購入できない' do
        @address_purchase.phone_number = '123456789'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number はハイフン無しの10桁か11桁である必要があります")
      end
      it 'phone_numberは12桁以上では購入できない' do
        @address_purchase.phone_number = '123456789123'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number はハイフン無しの10桁か11桁である必要があります")
      end
      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @address_purchase.phone_number = '123456789あ'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number はハイフン無しの10桁か11桁である必要があります")
      end
      it "tokenが空では購入できない" do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが紐付いていなければ購入できない" do
        @address_purchase.user_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "product_detail_idが紐付いていなければ購入できない" do
        @address_purchase.product_detail_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Product detail can't be blank")
      end
    end
  end
end