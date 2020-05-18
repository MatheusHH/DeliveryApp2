class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.monetize :subtotal
      t.integer :delivery_status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
