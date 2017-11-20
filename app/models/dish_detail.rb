class DishDetail < ApplicationRecord
  # Direct associations

  has_many   :best_dishes,
             :class_name => "Dish",
             :foreign_key => "dish_details_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
