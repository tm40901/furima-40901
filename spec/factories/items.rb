FactoryBot.define do
  factory :item do
    name            {Faker::Commerce.product_name}
    information     {Faker::Lorem.sentence}
    category_id     {2}
    status_id       {2}
    shipping_fee_id {2}
    prefecture_id   {2}
    schedule_id     {2}
    price           {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
