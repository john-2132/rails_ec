# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def contents_of_cart
    @cart_items = cart_items
                  .joins(:item)
                  .where(
                    cart_items: { cart_id: id }
                  ).select(
                    'item_id, quantity, name, catalog_price, sale_price, description'
                  )
  end

  def cart_item_quantity
    cart_items.sum(:quantity)
  end
end
