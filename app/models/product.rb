class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  monetize :price_cents

  enum status: [:ativo, :inativo]
end
