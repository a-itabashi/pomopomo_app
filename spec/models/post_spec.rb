require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {FactoryBot.create :post, :with_post_image}

  it "投稿、添付ファイルがあれば有効な状態かどうか)" do
  end

  it "投稿、添付ファイル、両方無い場合、無効な状態かどうか" do
    post = FactoryBot.build(:post, content: nil)
    expect(post).to be_invalid
  end

  describe "#content" do
    it "投稿のみの場合、有効かどうか" do
      post = FactoryBot.build(:post, post_image: nil)
      expect(post).to be_valid
    end

    it "投稿が101文字以上の場合、無効かどうか" do
      post = FactoryBot.build(:post, content: "a" * 101 )
      expect(post).to be_invalid
    end
  end

  describe "#post_image" do
    it "画像のみの場合、有効かどうか" do
      post = FactoryBot.build(:post, content: nil)
      expect(post).to be_valid
    end

    it "添付ファイルの容量が5MBを超える場合、無効かどうか" do 
    end

    it "添付ファイルの形式がjpg,jpeg,gif,png以外の場合、無効かどうか" do  
    end
  end
end

# https://blog.eq8.eu/til/factory-bot-trait-for-active-storange-has_attached.html
