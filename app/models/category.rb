class Category < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :restrict_with_exception

  enum active: [:ativo, :inativo]

  validates :name, :active, presence: true
end
