require 'rails_helper'

RSpec.describe Music, type: :model do
  let!(:music) {FactoryBot.create(:music)}

  it "音楽データのマスターを作成できるかどうか" do
    music
    expect(music).to be_valid
  end

  it "音楽データが重複した場合、無効になるかどうか" do
    music
    music_2 = FactoryBot.build(:music)
    expect(music_2).to_not be_valid
  end
end
