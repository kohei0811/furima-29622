FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"あ"}
    last_name             {"あ"}
    first_name_kana       {"ア"}
    last_name_kana        {"ア"}
    date_of_birth         {"2000/01/01"}
  end
end