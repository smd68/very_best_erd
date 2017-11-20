class AddLocationLatitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :location_latitude, :float
  end
end
