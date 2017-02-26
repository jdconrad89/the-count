class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_many :recipes
end
