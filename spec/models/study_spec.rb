require 'rails_helper'

RSpec.describe Study, type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:user_2) {FactoryBot.create(:admin_user)}

  it "学習レコードを作成できるかどうか" do
    study = Study.create!(user_id: user.id, set: 1, start_at: Date.today)
    expect(study).to be_valid
  end

  it "同日で、同じユーザーであれば新しいレコードは作成されない" do
    Study.create!(user_id: user.id, set: 1, start_at: Date.today)
    study_2 = Study.new(user_id: user.id, set: 2, start_at: Date.today)
    expect(study_2).to_not be_valid
  end

  it "違う日で、同じユーザーであれば新しいレコードは作成されるかどうか" do
    Study.create!(user_id: user.id, set: 1, start_at: Date.today)
    study_2 = Study.new(user_id: user.id, set: 1, start_at: Date.today+1)
    expect(study_2).to be_valid
  end

  it "同日で、違うユーザーであれば新しいレコードが作成されるかどうか" do
    Study.create!(user_id: user.id, set: 1, start_at: Date.today)
    study_2 = Study.new(user_id: user_2.id, set: 1, start_at: Date.today)
    expect(study_2).to be_valid
  end
end
