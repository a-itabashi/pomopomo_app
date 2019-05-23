RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def after_login_user
    visit root_path
    click_on "ログイン"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "testtest"
    click_on "ログイン"
  end

  def after_login_admin
    visit root_path
    click_on "ログイン"
    fill_in "メールアドレス", with: "admin@example.com"
    fill_in "パスワード", with: "adminadmin"
    click_on "ログイン"
  end
end
