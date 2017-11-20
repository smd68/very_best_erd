class Dish < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :class_name => "DishDetail",
             :foreign_key => "dish_details_id"

  # Indirect associations

  # Validations

end
