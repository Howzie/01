class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :bank_name
      t.string :bank_address
      t.string :account_no
      t.string :IFSC
      t.string :PAN
      t.string :GST


      t.timestamps null: false
    end
  end
end
