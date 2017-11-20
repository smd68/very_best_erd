require 'open-uri'
class Venue < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
