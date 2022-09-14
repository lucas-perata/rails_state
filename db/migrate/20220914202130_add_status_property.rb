class AddStatusProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :status, :string
  end
end
