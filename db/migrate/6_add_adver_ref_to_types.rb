class AddAdverRefToTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :advertisements, :adver_type, foreign_key: true
  end
end
