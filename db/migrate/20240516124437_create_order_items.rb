# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :code, null: false
      t.integer :quantity, null: false
      t.text :description
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
