class Category < ApplicationRecord
  belongs_to :user

  enum active: [:ativo, :inativo]

  validates :name, :active, presence: true
end
