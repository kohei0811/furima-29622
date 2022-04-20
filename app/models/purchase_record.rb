class PurchaseRecord < ApplicationRecord

  belongs_to :user
  belongs_to :product_detail
  has_one :address

  
end
