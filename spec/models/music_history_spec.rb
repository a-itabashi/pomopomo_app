require 'rails_helper'

RSpec.describe MusicHistory, type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:music) {FactoryBot.create(:music)}

  it "再生履歴の中間テーブルを作成できるかどうか" do
    music_history = MusicHistory.create!(user_id: user.id, music_id: music.id)
    expect(music_history).to be_valid
  end

  it "音楽とユーザーが重複した再生履歴の中間テーブルを作成できるかどうか" do
    MusicHistory.create!(user_id: user.id, music_id: music.id)
    music_history_2 = MusicHistory.new(user_id: user.id, music_id: music.id)
    expect(music_history_2).to be_valid
  end
end
