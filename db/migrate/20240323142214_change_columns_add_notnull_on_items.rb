# frozen_string_literal: true

class ChangeColumnsAddNotnullOnItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :name, true
    change_column_null :items, :catalog_price, true
    change_column_null :items, :code, true
    change_column_null :items, :stock, true
  end
end
