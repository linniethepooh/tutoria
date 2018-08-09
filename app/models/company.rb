class Company < ApplicationRecord
  has_many :users
  has_many :tutorials

  validates :name, :address, :city, :zipcode, :country, presence: true
  validates :name, uniqueness: true
end
