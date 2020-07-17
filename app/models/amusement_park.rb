class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_price

  has_many :rides

  def sort_rides_alphabetically
    rides.order(:name)
  end

  def avg_thrill_rating
    rides.average(:thrill_rating).round(1)
  end
end
