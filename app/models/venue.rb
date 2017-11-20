class Venue < ApplicationRecord
  # Direct associations

  has_many   :venues_details,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :favorites,
             :source => :dish

  has_many   :users,
             :through => :favorites,
             :source => :user

  # Validations

end
