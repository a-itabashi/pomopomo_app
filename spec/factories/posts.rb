FactoryBot.define do
  factory :post do
    content {"test_text"}
    user
    post_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpeg') }
  end

  factory :post_2, class: Post do
    content {"test_text_2"}
    user { User.first || create(:admin_user)}
  end
end
