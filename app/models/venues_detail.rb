class VenuesDetail < ApplicationRecord
  # Direct associations

  belongs_to :venue

  # Indirect associations

  has_one    :favorite,
             :through => :venue,
             :source => :favorites

  # Validations

end
