class CreateMedicines < ActiveRecord::Migration[8.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
