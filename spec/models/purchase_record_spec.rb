require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  before do
    @purchase_record = FactoryBot.build(:purchase_record)
  end

  describe '商品出品' do
    context '商品が購入できる場合' do
      it 'post_codeとprefecture_id、municipality、address、phone_number、tokenが存在していれば保存できる' do
        expect(@purchase_record).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空では保存できない' do
        @purchase_record.post_code = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれていないと保存できない' do
        @purchase_record.post_code = '1234567'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post code はハイフンを含む必要があります")
      end
      it 'prefecture_idが空では保存できない' do
        @purchase_record.prefecture_id = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Prefecture name can't be blank")
      end
      it 'municipalityが空では保存できない' do
        @purchase_record.municipality = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Municipality explanation can't be blank")
      end
      it 'addressが空では保存できない' do
        @purchase_record.address = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_record.phone_number = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフン無しの11桁でないと保存できない' do
        @purchase_record.phone_number = '123-4567891'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Phone number はハイフン無しの11桁である必要があります")
      end
      it "tokenが空では登録できないこと" do
        @purchase_record.token = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
