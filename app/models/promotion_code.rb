# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  validates :code, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]{7}\z/ }
  validates :discount_price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
