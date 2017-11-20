class Dish < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  belongs_to :dish,
             :class_name => "DishDetail",
             :foreign_key => "dish_details_id"

  # Indirect associations

  has_many   :users,
             :through => :favorites,
             :source => :user

  has_many   :venues,
             :through => :favorites,
             :source => :venue

  # Validations

end
