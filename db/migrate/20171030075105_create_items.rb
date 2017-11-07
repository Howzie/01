class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :code
      t.string :name
      t.string :specification
      t.integer :price
      t.integer :stock
      t.integer :delivery_days

      t.timestamps null: false
    end
    add_index :items, [:code]
  end
end
