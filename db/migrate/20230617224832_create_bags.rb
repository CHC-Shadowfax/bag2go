class CreateBags < ActiveRecord::Migration[7.0]
  def change
    create_table :bags do |t|
      t.string :name
      t.text :description
      t.integer :sku
      t.text :attributes
      t.float :price_day
      t.boolean :available, default: true
      t.boolean :reserved, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
