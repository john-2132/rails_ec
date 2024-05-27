# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def checkout_order(checkout_items)
    OrderItem.transaction do
      order_items = create_order_items(checkout_items)
      order_items.each(&:save!)
    end
    save!
    order_items
  end

  def create_order_items(checkout_items)
    checkout_items.map do |checkout_item|
      order_items.build(
        name: checkout_item.name,
        price: checkout_item.sale_price || checkout_item.catalog_price,
        code: checkout_item.code,
        quantity: checkout_item.quantity,
        description: checkout_item.description
      )
    end
  end

  def order_items_detail
    order_items.select(
      'name, price, code, quantity, description'
    )
  end
end
