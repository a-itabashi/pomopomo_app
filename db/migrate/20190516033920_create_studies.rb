class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :set, null: false
      t.datetime :start_at, null: false

      t.timestamps
    end
  end
end
