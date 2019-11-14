class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :title,        null: false
      t.text :description,    null: false
      t.string :image
      t.string :status,       null: false, default: :draft

      t.timestamps            null: false
    end
  end
end
