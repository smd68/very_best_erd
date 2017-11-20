class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :restaurant_name
      t.string :neighborhood
      t.string :location

      t.timestamps

    end
  end
end
