require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#name" do
    it "名前がなければ無効な状態かどうか" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が50文字を超えた場合、無効な状態かどうか" do
      user = User.new(name: "a"*51)
      user.valid?
      expect(user.errors[:name]).to include("は50文字以内で入力してください")
    end
  end

  context "emailカラムのバリデーションについて" do

    it "メールアドレスがなければ無効な状態かどうか" do
    
    end

    it "メールアドレスが255文字を超えた場合、無効な状態かどうか" do
    
    end

    it "メールアドレスが重複していれば無効な状態かどうか" do
  
  end

  end


 
end
