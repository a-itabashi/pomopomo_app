FactoryBot.define do
  factory :post do
    content {"test_text"}
    user
    post_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpeg') }
  end

  factory :post_admin, class: Post do
    content {"admin_text"}
    user {admin_user.id}
  end 
end
