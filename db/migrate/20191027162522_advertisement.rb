#:reek:FeatureEnvy and :reek:UncommunicativeVariableName and :reek:TooManyStatements
class Advertisement < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :description
      t.string :image 
      t.string :type_of_adver
      t.string :status

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
