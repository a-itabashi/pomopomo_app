FactoryBot.define do
  factory :post do
    content {"test_text"}
    user
    # after :create do |b|
    #   b.update_column(:post_image, "spec/fixtures/image.jpg")
    # end
    post_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpeg') }
  end

   # before(:build) do |attachment|
   #  attachment.post_image.attach(io: File.open(Rails.root.join("spec", "resources", "/image.jpg")), filename: 'image.jpg', content_type: "jpg")
   # end

  

  
end
