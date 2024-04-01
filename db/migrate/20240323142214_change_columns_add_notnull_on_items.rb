# frozen_string_literal: true

class ChangeColumnsAddNotnullOnItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :catalog_price, false
    change_column_null :items, :code, false
    change_column_null :items, :stock, false
  end
end
