# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy

  validates :code, uniqueness: true

  def related_products
    Item.where.not(code: code).order(created_at: :desc).limit(4) # rubocop:disable Style/HashSyntax
  end

  def self.adequately_stocked?(id, quantity)
    item = Item.where(id:).select('stock').first
    item[:stock] >= quantity
  end
end
