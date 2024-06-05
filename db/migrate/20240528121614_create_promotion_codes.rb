# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes, id: false do |t|
      t.string :code, null: false, primary_key: true
      t.integer :discount_price, null: false

      t.timestamps
    end

    add_index :promotion_codes, :code, unique: true
  end
end
