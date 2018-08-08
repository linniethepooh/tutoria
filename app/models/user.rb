class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum status: [:staff, :manager]

  validates :username, :first_name, :last_name, presence: true
end
