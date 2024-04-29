# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def self.adequately_stocked?(id, quantity)
    item = Item.find_by(id:)
    item.stock >= quantity
  end
end
