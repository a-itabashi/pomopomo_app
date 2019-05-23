require 'rails_helper'

RSpec.feature "Posts", type: :feature, js: true do
 # name: "test_user", email:"test@example.com", password: "testtest"
  given!(:user) {FactoryBot.create(:user)}
  # name: "admin", email:"admin@example.com", password: "adminadmin"
  given!(:admin_user) {FactoryBot.create(:admin_user)}

  background do
    after_login_user
  end
  scenario "つぶやきだけ、投稿ができるかどうか" do
    click_on "掲示板"
    fill_in 'post_content', with: "テスト投稿だよ"
    click_on "pomoをつぶやく"
    expect(page).to have_content "テスト投稿だよ"
  end
  scenario "画像だけ、投稿ができるかどうか" do
    click_on "掲示板"
    attach_file "画像投稿", "#{Rails.root}/spec/fixtures/image.jpg"
    click_on "pomoをつぶやく"
    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
  end
  scenario "画像、投稿、両方とも投稿ができるかどうか" do
    click_on "掲示板"
    fill_in 'post_content', with: "テスト投稿だよ"
    attach_file "画像投稿", "#{Rails.root}/spec/fixtures/image.jpg"
    click_on "pomoをつぶやく"
    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
    expect(page).to have_content "テスト投稿だよ"
  end
  scenario "画像、投稿、両方とも空で投稿した場合、何もアクションが起きないかどうか" do
    click_on "掲示板"
    click_on "pomoをつぶやく"
    expect(page).to_not have_content "削除する"
  end
end
