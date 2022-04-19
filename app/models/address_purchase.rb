class AddressPurchase
  include ActiveModel::Model
  attr_accessor :image, :user_id, :product_detail_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含む必要があります' }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number,format: { with: /\A\d{10,11}\z/, message: 'はハイフン無しの10桁か11桁である必要があります' }
    validates :token, presence: true
    validates :user_id
    validates :product_detail_id
  end

  def save
    purchase_record = PurchaseRecord.create(product_detail_id: product_detail_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name,phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
  
end