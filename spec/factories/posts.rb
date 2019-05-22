FactoryBot.define do
  factory :post do
    content {"test_text"}
    trait :with_post_image do
      post_image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image.jpg'), 'image/jpg') }
    end
    user
  end

   # before(:build) do |attachment|
   #  attachment.post_image.attach(io: File.open(Rails.root.join("spec", "resources", "/image.jpg")), filename: 'image.jpg', content_type: "jpg")
   # end

  

  
end
