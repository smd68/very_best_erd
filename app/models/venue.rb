class Venue < ApplicationRecord
  # Direct associations

  has_many   :venues_details,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
