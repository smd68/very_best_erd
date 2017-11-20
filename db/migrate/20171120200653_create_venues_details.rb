class CreateVenuesDetails < ActiveRecord::Migration
  def change
    create_table :venues_details do |t|
      t.integer :dish_id
      t.integer :venue_id

      t.timestamps

    end
  end
end
