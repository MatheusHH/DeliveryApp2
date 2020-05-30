class Profile < ApplicationRecord
  belongs_to :customer

  validates :name, :number, :cellphone, :state, :city, :cep, :neighborhood, :street, presence: true
end
