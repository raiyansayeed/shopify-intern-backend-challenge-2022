class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.references :seller, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
