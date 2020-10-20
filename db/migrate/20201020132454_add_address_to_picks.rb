class AddAddressToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :address, :string
  end
end
