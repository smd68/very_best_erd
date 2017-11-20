class FoodCategory < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :class_name => "DishDetail",
             :foreign_key => "category_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
