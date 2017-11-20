class AddLocationLongitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :location_longitude, :float
  end
end
