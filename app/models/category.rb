class Category < ApplicationRecord
  belongs_to :user

  enum active: [:ativo, :inativo]
end
