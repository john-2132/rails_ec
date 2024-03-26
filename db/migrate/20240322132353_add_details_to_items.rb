# frozen_string_literal: true

class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    change_table :items, bulk: true do |t|
      t.string :code
      t.text :description
      t.integer :stock
    end
  end
end
