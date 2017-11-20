class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :dish_details_id

      t.timestamps

    end
  end
end
