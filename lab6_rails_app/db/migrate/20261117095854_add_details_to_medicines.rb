class AddDetailsToMedicines < ActiveRecord::Migration[8.1]
  def change
    add_column :medicines, :description, :text
    add_reference :medicines, :user, null: true, foreign_key: true
  end
end
