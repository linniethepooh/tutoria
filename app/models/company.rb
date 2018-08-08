class Company < ApplicationRecord
  has_many :users

  validates :name, :address, :city, :zipcode, :country, presence: true
  validates :name, uniqueness: true
end
