FactoryBot.define do
  factory :post do
    user { nil }
    content { "MyText" }
    post_image { "MyString" }
  end
end
