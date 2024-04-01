# frozen_string_literal: true

class RemoveEmailFromUsers < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :email
  end

  def down
    add_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
