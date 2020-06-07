class AddCpfToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :cpf, :string
  end
end
