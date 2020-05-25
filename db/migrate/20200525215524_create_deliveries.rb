class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.text :details
      t.references :order, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
