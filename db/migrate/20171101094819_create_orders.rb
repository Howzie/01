class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :merchant_id
      t.integer :item_id
      t.integer :item_qty
      t.string :delivery_add
      t.string :postal_code
      t.date :delivery_date
      t.boolean :is_confirm, default: :false
      t.boolean :is_delivered, default: :false

      t.timestamps null: false
    end
  end
end
