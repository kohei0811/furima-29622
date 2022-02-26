FactoryBot.define do
  factory :product_detail do
    product_name          {Faker::Commerce.name}
    product_explanation   {Faker::Lorem.sentence}
    category_id           {2}
    status_id             {2}
    delivery_fee_id       {2}
    prefecture_id         {2}
    days_to_ship_id       {2}
    price                 {400}
    association :user

    after(:build) do |product_detail|
      product_detail.image.attach(io: File.open('public/images/nagano-The_eruption_of_Mt.Yake-sのコピー.jpg'), filename: 'test_image.jpg')
    end
  end
end
