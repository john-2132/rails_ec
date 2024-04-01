# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true

  has_many :items, dependent: :restrict_with_error
end
