# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def checkout_order(checkout_items, code)
    ActiveRecord::Base.transaction do
      order_items = create_order_items(checkout_items)
      if code.present?
        promotion_code = PromotionCode.lock.find_by(code:)
        order_items = apply_promotion_code(order_items, promotion_code[:code], promotion_code[:discount_price])
        promotion_code.destroy!
      end
      order_items.each(&:save!)
      save!
    end
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

  def apply_promotion_code(checkout_items, code, discount_price)
    checkout_items.push(
      order_items.build(
        name: 'プロモーションコード',
        price: -discount_price.to_i,
        code:,
        quantity: 1
      )
    )
  end
end
