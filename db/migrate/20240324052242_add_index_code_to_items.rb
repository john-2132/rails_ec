# frozen_string_literal: true

class AddIndexCodeToItems < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :code, unique: true
  end
end
