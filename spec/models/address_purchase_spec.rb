require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  describe '商品出品' do
    context '商品が購入できる場合' do
      it 'post_codeとprefecture_id、municipality、address、phone_number、tokenが存在していれば保存できる' do
        expect(@address_purchase).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空では保存できない' do
        @address_purchase.post_code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれていないと保存できない' do
        @address_purchase.post_code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post code はハイフンを含む必要があります")
      end
      it 'prefecture_idが空では保存できない' do
        @address_purchase.prefecture_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では保存できない' do
        @address_purchase.municipality = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存できない' do
        @address_purchase.address = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @address_purchase.phone_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフン無しの11桁でないと保存できない' do
        @address_purchase.phone_number = '123-4567891'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number はハイフン無しの11桁である必要があります")
      end
      it "tokenが空では登録できないこと" do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end