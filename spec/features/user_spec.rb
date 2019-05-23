require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # name: "test_user", email:"test@example.com", password: "testtest"
  given(:user) {FactoryBot.create(:user)}
  # name: "admin", email:"admin@example.com", password: "adminadmin"
  given(:admin_user) {FactoryBot.create(:admin_user)}
  
  scenario "新規会員登録ができるかどうか" do
    visit root_path
    click_on "新規登録"
    fill_in "名前 or ニックネーム", with: "テストユーザー"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード",with: "testtest"
    fill_in "パスワードの確認",with: "testtest"
    click_on "新規登録"
    expect(page).to have_content "アカウント登録が完了しました。"
  end

  feature "ログイン・ログアウト・退会のテスト" do
    background do
      user
    end
    scenario "ログインができるかどうか" do
      visit root_path
      click_on "ログイン"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "testtest"
      click_on "ログイン"
      expect(page).to have_content "ログインしました。"
    end

    scenario "ログアウトができるかどうか" do
      after_login_user #ログイン後の処理をspec_helper.rbで定義
      click_on "ログアウト"
      expect(page).to have_content "新規登録" && "POMO"
    end
    scenario "ログイン状態を保持した状態でログインボタンを押したらmusics/indexページに遷移するかどうか" do
      after_login_user
      visit root_path
      click_on "ログイン"
      expect(page).to have_content "すでにログインしています。"
    end
    scenario "退会ができるかどうか" do
      after_login_user
      click_on "退会"
      click_on "ログイン"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "testtest"
      click_on "ログイン"
      expect(page).to have_content "メールアドレス もしくはパスワードが不正です。"
    end
  end

  feature "ログイン後のテスト" do
    background do
      user
      admin_user
    end
    feature "プロフィール" do
      
      context "本人の場合" do
        scenario "プロフィールを見れるかどうか" do
          after_login_user
          click_on "プロフィール"
          expect(page).to have_content "test_userさんのプロフィール"
        end
        scenario "プロフィールを編集できるかどうか" do
          after_login_user
          click_on "プロフィール"
          click_on "プロフィールを編集"
          fill_in "名前 or ニックネーム", with: "編集後のtest_user"
          fill_in "メールアドレス", with: "test@example.com"
          attach_file "プロフィール画像", "#{Rails.root}/spec/fixtures/image.jpg"
          fill_in "自己紹介文", with: "test_userの紹介文を編集しました"
          click_on "編集する"
          expect(page).to have_content "アカウント情報を変更しました。" && "編集後のtest_user"
          expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
        end
      end
      context "管理者の場合" do
        scenario "プロフィールを見れるかどうか" do
          after_login_admin
          click_on "ユーザー一覧"
          all('tbody tr')[0].click_on "詳細"
          expect(page).to have_content "test_userさんのプロフィール"
        end
        scenario "プロフィールを編集できないようになっているかどうか" do
          after_login_admin
          click_on "ユーザー一覧"
          all('tbody tr')[0].click_on "詳細"
          expect(page).to_not have_content  "プロフィールを編集"
        end
        scenario "ユーザーを削除できるかどうか" do
          after_login_admin
          click_on "ユーザー一覧"
          all('tbody tr')[0].click_on "削除"
          expect(page).to have_content  "ユーザーを削除しました"
        end
      end
      context "他人の場合" do
        scenario "プロフィールを見れないか" do
          after_login_user
          visit user_path(admin_user.id)
          expect(page).to have_content  "アクセスできません"
        end
        scenario "プロフィールを見れないか" do
          after_login_user
          visit user_path(admin_user.id)
          expect(page).to have_content  "アクセスできません"
        end
      end
    end
  end


end
