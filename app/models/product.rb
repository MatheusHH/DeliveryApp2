class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image

  monetize :price_cents

  enum status: [:ativo, :inativo]

  def second
    self[1]
  end

  def third
    self[2]
  end
end
