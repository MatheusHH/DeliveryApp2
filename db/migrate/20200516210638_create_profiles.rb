class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :city
      t.string :state
      t.string :cellphone
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
