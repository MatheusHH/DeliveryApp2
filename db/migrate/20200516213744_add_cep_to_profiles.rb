class AddCepToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :cep, :string
  end
end
