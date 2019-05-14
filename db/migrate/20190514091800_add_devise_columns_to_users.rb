class AddDeviseColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string, null:false, default:""
    add_column :users, :provider, :string, null:false, default:""
    add_column :users, :name, :string, null:false, default:""
    add_column :users, :image_url, :string, null:false, default:""
    add_index :users, [:uid, :provider], unique: true
    add_column :users, :token, :string
    add_column :users, :meta, :string
  end
end
