class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,                null: false
      t.string :encrypted_password,   null: false

      t.string :nickname,             null: false
      t.string :first_name,           null: false
      t.string :last_name,            null: false

      t.timestamps                    null: false
    end

    add_index :users, :email,         unique: true
    add_index :users, :nickname,      unique: true
  end
end
