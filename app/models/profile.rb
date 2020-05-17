class Profile < ApplicationRecord
  belongs_to :customer

  validates :name, cellphone, :state, :city, :cep, :neighborhood, :street, presence: true
end
