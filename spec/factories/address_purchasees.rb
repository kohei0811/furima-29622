FactoryBot.define do
  factory :address_purchase do
    post_code           {"123-4567"}
    prefecture_id       {2}
    municipality        {"東京"}
    address             {"東京"}
    building_name       {"マンション"}
    phone_number        {12312345678}
    token               {"tok_abcdefghijk00000000000000000"}
    user_id             {1}
    product_detail_id   {1}
  end
end