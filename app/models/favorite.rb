class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :dish

  belongs_to :venue

  belongs_to :user

  # Indirect associations

  has_one    :venues_detail,
             :through => :venue,
             :source => :venues_details

  # Validations

end
