require 'rails_helper'

RSpec.feature "Musics", type: :feature do
 # name: "test_user", email:"test@example.com", password: "testtest"
  given!(:user) {FactoryBot.create(:user)}

  background do
    after_login_user
  end

  scenario "音楽を検索できるかどうか",js: true do
    fill_in 'q', with: "作業用"
    click_on "Search"
    expect(page).to have_content "作業用BGM"
  end

  scenario "検索した音楽をクリックしたら再生履歴に反映されるかどうか",js: true do
    fill_in 'q', with: "作業用"
    click_on "Search"
    click_on "作業用MIX!!"
    click_on "再生履歴"
    expect(page).to have_content "作業用MIX!!"
  end

  scenario "再生履歴をクリックしたらmusics/playページに遷移するかどうか",js: true do
    fill_in 'q', with: "作業用"
    click_on "Search"
    click_on "作業用MIX!!"
    click_on "再生履歴"
    click_link "再生する"
    expect(page).to have_content "Run Time" && "Start" && "作業用MIX!!"
  end

  scenario "音楽を再生したらカレンダーに反映されるかどうか" do
    Study.create!(user_id: user.id, set: 1, start_at: Date.today)
    click_on "プロフィール"
    expect(page).to have_content "1 pomo"
  end
end