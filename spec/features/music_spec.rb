require 'rails_helper'

RSpec.feature "Musics", type: :feature, js: true  do
 # name: "test_user", email:"test@example.com", password: "testtest"
  given!(:user) {FactoryBot.create(:user)}

  background do
    after_login_user
  end

  scenario "音楽を検索できるかどうか" do
    fill_in 'q', with: "作業用"
    click_on "Search"
    expect(page).to have_content "作業用BGM"
  end

  scenario "検索した音楽をクリックしたら再生履歴に反映されるかどうか" do
    fill_in 'q', with: "作業用"
    click_on "Search"
    click_on "作業用MIX!!"
    click_on "再生履歴"
    expect(page).to have_content "作業用MIX!!"
  end
end