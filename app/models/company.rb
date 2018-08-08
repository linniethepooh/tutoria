class Company < ApplicationRecord
  has_many :users

  validates :name, :main_logo, :address, :city, :zipcode, :country, presence: true
end
