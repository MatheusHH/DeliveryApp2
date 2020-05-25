class Delivery < ApplicationRecord
  belongs_to :order

  enum status: [ :pendente, :enviando, :entregue ]

  validates :order_id, uniqueness: { scope: :order_id,
    message: "You have already created this delivery!" }
end
