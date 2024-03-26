class User < ApplicationRecord
  has_secure_password

  validate :name, presence: true
  validate :email, presence: true, uniqueness: true

  has_many :items, dependent: :restrict_with_error
end
