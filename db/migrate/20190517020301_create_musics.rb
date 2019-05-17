class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :title, null: false
      t.string :image_url
      t.string :music_url

      t.timestamps
    end
    add_index :musics, :title, unique: true
  end
end
