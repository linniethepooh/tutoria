class Company < ApplicationRecord
  has_many :users

  validates :name, :address, :city, :zipcode, :country, presence: true
end
