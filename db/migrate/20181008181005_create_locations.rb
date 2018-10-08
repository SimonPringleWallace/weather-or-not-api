class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
