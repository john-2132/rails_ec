class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :catalog_price
      t.float :sale_price

      t.timestamps
    end
  end
end