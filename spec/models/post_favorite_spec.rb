require 'rails_helper'

RSpec.describe PostFavorite, type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:post) {FactoryBot.create(:post_2)}

  it "いいね機能の中間テーブルを作成できるかどうか" do
    post_favorite = PostFavorite.create!(user_id: user.id, post_id: post.id)
    expect(post_favorite).to be_valid
  end

  it "ユーザーと投稿が重複した場合、無効になるかどうか" do
    PostFavorite.create!(user_id: user.id, post_id: post.id)
    post_favorite_2 = PostFavorite.new(user_id: user.id, post_id: post.id)
    expect(post_favorite_2).to_not be_valid
  end
end