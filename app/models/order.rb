class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items, dependent: :restrict_with_exception
  has_many :products, through: :order_items
  has_one :delivery

  monetize :subtotal_cents
  enum status: [ :pendente, :fechado ]

  before_save :set_subtotal

  def subtotal_value
    order_items.collect{|order_item| order_item.valid? ? order_item.unit_price_value*order_item.quantity : 0}.sum
  end

  private

  def set_subtotal
    self[:subtotal_cents] = subtotal_value
  end
end
