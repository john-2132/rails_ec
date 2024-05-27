# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :address2, null: false
      t.string :country
      t.string :state
      t.string :zip, null: false
      t.string :same_address
      t.string :save_info
      t.string :payment_method, null: false
      t.string :cc_name, null: false
      t.string :cc_number, null: false
      t.string :cc_expiration, null: false
      t.string :cc_cvv, null: false

      t.timestamps
    end
  end
end
