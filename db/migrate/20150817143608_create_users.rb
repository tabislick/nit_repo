class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps null: false

      
    end
    add_index :users, :uid
    add_index :users, :provider
    add_index :users, [:uid, :provider], unique: true
  end
end
