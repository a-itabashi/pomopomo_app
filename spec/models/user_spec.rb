require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create(:user)}
  let(:user_1) {FactoryBot.create(:user_1)}
  let(:admin_user) {FactoryBot.create(:admin_user)}

  describe "FactoryBotの検証" do
    it "通常のユーザー(admin権限無し)は有効かどうか" do
      expect(user).to be_valid
    end
    it "管理者ユーザー(admin権限有り)は有効かどうか" do
      expect(admin_user).to be_valid
    end
  end

  describe "#name" do
    it "名前がなければ無効な状態かどうか" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が50文字を超えた場合、無効な状態かどうか" do
      user_sample = FactoryBot.build(:user, name: "a"*51)
      user_sample.valid?
      expect(user_sample.errors[:name]).to include("は50文字以内で入力してください")
    end
  end

  describe "#email" do
    it "メールアドレスがなければ無効な状態かどうか" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "メールアドレスが255文字を超えた場合、無効な状態かどうか" do
      user = FactoryBot.build(:user, email: "a"*255+"@example.com")
      user.valid?
      expect(user.errors[:email]).to include("は255文字以内で入力してください")
    end
    it "メールアドレスが重複していれば無効な状態かどうか" do
      user = FactoryBot.create(:user)
      user_sample = FactoryBot.build(:user, email: 'test@example.com')
      user_sample.valid?
      expect(user_sample.errors[:email]).to include("はすでに存在します")
    end
    it 'メールアドレスの形式に誤りがあれば無効な状態かどうか' do
      user = FactoryBot.build(:user, email: 'test')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
  end

  it 'パスワードが5文字以下なら無効な状態かどうか' do
      user = FactoryBot.build(:user, password: 'testt')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
  end


 
end
