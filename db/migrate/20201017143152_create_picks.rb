class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.integer :group_id
      t.string :location
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
