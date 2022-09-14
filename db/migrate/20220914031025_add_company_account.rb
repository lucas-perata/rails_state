class AddCompanyAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :company, :string
  end
end
