class AddAddressToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :address, :string
    add_column :picks, :latitude, :float
    add_column :picks, :longitude, :float

    add_column :picks, :feel, :string

  end
end
