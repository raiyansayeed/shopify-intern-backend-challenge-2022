class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :quantity, null: false
      t.references :product, null: false, foreign_key: true
      t.string :kind, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
