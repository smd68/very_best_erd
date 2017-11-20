class CreateDishDetails < ActiveRecord::Migration
  def change
    create_table :dish_details do |t|
      t.string :dish
      t.integer :category_id

      t.timestamps

    end
  end
end
