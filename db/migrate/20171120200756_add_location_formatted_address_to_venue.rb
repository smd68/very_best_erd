class AddLocationFormattedAddressToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :location_formatted_address, :string
  end
end
