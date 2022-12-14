# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :rooms
      t.integer :square_meters
      t.integer :bathrooms
      t.string :photo
      t.references :account

      t.timestamps
    end
  end
end
